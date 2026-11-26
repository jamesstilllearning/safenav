/*
 * SAFENAV — SVG to JSON navigation graph extractor
 * Reads assets/maps/navigation_graph.svg and writes:
 *   assets/maps/navigation/navigation_graph.json
 *   assets/maps/navigation/node_mapping.json
 *   assets/maps/navigation/edge_mapping.json
 *   assets/maps/navigation/graph_validation_report.json
 *
 * Strategy:
 *   Nodes   = green circles (r=12, fill #338C18) -> sequential IDs N001..N164
 *   Edges   = green strokes (#338C18): straight <line> and <path>
 *             corridor lines are split at intermediate nodes lying on the segment
 *   Floors  = spatial zones (no <text> elements exist; labels are outlined glyphs)
 *             Building AB = left side (x < 2500), MB = right side (x >= 2500)
 *             Floor by Y: upper=3F, middle=2F, lower=GF (SVG y grows downward)
 *   Black lines, big r=50 circles, door swings -> flagged in validation, not edges
 */

import fs from "fs";
import path from "path";

const SVG_PATH = "assets/maps/navigation_graph.svg";
const OUT_DIR = "assets/maps/navigation";

const svg = fs.readFileSync(SVG_PATH, "utf8");
const lines = svg.split("\n");

const attr = (s, name) => {
  const m = s.match(new RegExp(`${name}="([^"]*)"`));
  return m ? m[1] : null;
};

// ---------- Parse elements ----------
const nodes = []; // {cx, cy}
const bigCircles = []; // r=50 light-green
const greenLines = []; // {x1,y1,x2,y2}
const greenPaths = []; // {d}
const blackLines = []; // raw
const rects = []; // {x,y,w,h,fill}

for (const line of lines) {
  const t = line.trim();
  if (!t.startsWith("<")) continue;
  if (t.startsWith("<circle")) {
    const fill = attr(t, "fill");
    const r = +attr(t, "r");
    if (fill === "#338C18" && r === 12) {
      nodes.push({ cx: +attr(t, "cx"), cy: +attr(t, "cy") });
    } else if (fill === "#D7FFCD" && r === 50) {
      bigCircles.push({ cx: +attr(t, "cx"), cy: +attr(t, "cy") });
    }
  } else if (t.startsWith("<line")) {
    const stroke = attr(t, "stroke");
    if (stroke === "#338C18") {
      greenLines.push({
        x1: +attr(t, "x1"),
        y1: +attr(t, "y1"),
        x2: +attr(t, "x2"),
        y2: +attr(t, "y2"),
      });
    } else if (stroke === "black") {
      blackLines.push(t);
    }
  } else if (t.startsWith("<path")) {
    const stroke = attr(t, "stroke");
    const d = attr(t, "d") || "";
    if (stroke === "#338C18") greenPaths.push({ d });
  } else if (t.startsWith("<rect")) {
    rects.push({
      x: +attr(t, "x"),
      y: +attr(t, "y"),
      w: +attr(t, "width"),
      h: +attr(t, "height"),
      fill: attr(t, "fill"),
    });
  }
}

console.log("Parsed:");
console.log("  nodes (green circles r=12):", nodes.length);
console.log("  big circles (r=50):", bigCircles.length);
console.log("  green straight lines:", greenLines.length);
console.log("  green curved paths:", greenPaths.length);
console.log("  black lines:", blackLines.length);
console.log("  rects:", rects.length);

// ---------- Geometry helpers ----------
const dist = (x1, y1, x2, y2) => Math.hypot(x2 - x1, y2 - y1);
const NODE_SNAP_TOL = 12; // px — endpoint must be within this of a node
const ON_SEG_TOL = 3; // px — perpendicular distance for "node lies on segment"

const nearestNode = (x, y) => {
  let best = null, bestD = Infinity;
  for (let i = 0; i < nodes.length; i++) {
    const d = dist(x, y, nodes[i].cx, nodes[i].cy);
    if (d < bestD) { bestD = d; best = i; }
  }
  return { idx: best, d: bestD };
};

// Perpendicular distance from point (px,py) to segment (x1,y1)-(x2,y2)
const pointSegDist = (px, py, x1, y1, x2, y2) => {
  const dx = x2 - x1;
  const dy = y2 - y1;
  const len2 = dx * dx + dy * dy;
  if (len2 === 0) return dist(px, py, x1, y1);
  let t = ((px - x1) * dx + (py - y1) * dy) / len2;
  t = Math.max(0, Math.min(1, t));
  return dist(px, py, x1 + t * dx, y1 + t * dy);
};

// ---------- Assign floors / buildings ----------
// Building: left side (x<2500) = AB, right side (x>=2500) = MB
// Floor: within building, by Y band (SVG y grows downward -> lower Y = upper floor)
//   AB bands: y<700 -> AB_3F, 700-1200 -> AB_2F, >=1200 -> AB_GF
//   MB bands: y<2700 -> MB_3F, 2700-3500 -> MB_2F, >=3500 -> MB_GF
const zoneFor = (x, y) => {
  const building = x < 2500 ? "AB" : "MB";
  let floor;
  if (building === "AB") {
    if (y < 700) floor = "AB_3F";
    else if (y < 1200) floor = "AB_2F";
    else floor = "AB_GF";
  } else {
    if (y < 2700) floor = "MB_3F";
    else if (y < 3500) floor = "MB_2F";
    else floor = "MB_GF";
  }
  return { building, floor };
};

// Sort nodes by building, then floor, then Y, then X for deterministic IDs
const floorOrder = { AB_3F: 0, AB_2F: 1, AB_GF: 2, MB_3F: 0, MB_2F: 1, MB_GF: 2 };
const buildingOrder = { AB: 0, MB: 1 };

const nodesWithZone = nodes.map((n, i) => ({ ...n, idx: i, ...zoneFor(n.cx, n.cy) }));
nodesWithZone.sort((a, b) => {
  if (buildingOrder[a.building] !== buildingOrder[b.building])
    return buildingOrder[a.building] - buildingOrder[b.building];
  if (floorOrder[a.floor] !== floorOrder[b.floor])
    return floorOrder[a.floor] - floorOrder[b.floor];
  if (a.cy !== b.cy) return a.cy - b.cy;
  return a.cx - b.cx;
});

// Assign sequential IDs N001..N164
const nodeMap = new Map(); // original index -> node id
const nodeRecords = [];
nodesWithZone.forEach((n, i) => {
  const id = `N${String(i + 1).padStart(3, "0")}`;
  nodeMap.set(n.idx, id);
  nodeRecords.push({
    id,
    x: n.cx,
    y: n.cy,
    building_id: n.building,
    floor_id: n.floor,
    node_type: "pathway",
  });
});

console.log("\nNode ID assignment (first 10):");
nodeRecords.slice(0, 10).forEach(r => console.log(`  ${r.id} (${r.x},${r.y}) ${r.building_id}/${r.floor_id}`));

// ---------- Build edges ----------
const candidateEdges = []; // {fromIdx, toIdx, type, x1,y1,x2,y2}

const addEdgeCandidates = (x1, y1, x2, y2, type) => {
  const a = nearestNode(x1, y1);
  const b = nearestNode(x2, y2);
  candidateEdges.push({ fromIdx: a.idx, toIdx: b.idx, fromD: a.d, toD: b.d, type, x1, y1, x2, y2 });
};

// Straight lines: direct endpoint-to-endpoint edges
for (const l of greenLines) {
  addEdgeCandidates(l.x1, l.y1, l.x2, l.y2, "straight");
}

// Curved paths: endpoint-to-endpoint (stairs/ramps)
for (const p of greenPaths) {
  const pairs = p.d.match(/([\d.]+)\s+([\d.]+)/g);
  if (!pairs) continue;
  const first = pairs[0].split(/\s+/).map(Number);
  const last = pairs[pairs.length - 1].split(/\s+/).map(Number);
  addEdgeCandidates(first[0], first[1], last[0], last[1], "curved");
}

// ---------- Corridor splitting: nodes lying ON a line segment ----------
// For each straight line, find nodes lying on the segment (not at endpoints)
// and split into consecutive edges.
const splitEdges = []; // {fromIdx, toIdx, type, distance}

for (let li = 0; li < greenLines.length; li++) {
  const l = greenLines[li];
  // Find all nodes lying on this segment
  const onSeg = [];
  for (let ni = 0; ni < nodes.length; ni++) {
    const n = nodes[ni];
    // Skip nodes that are essentially at the endpoints
    if (dist(n.cx, n.cy, l.x1, l.y1) < ON_SEG_TOL) continue;
    if (dist(n.cx, n.cy, l.x2, l.y2) < ON_SEG_TOL) continue;
    const d = pointSegDist(n.cx, n.cy, l.x1, l.y1, l.x2, l.y2);
    if (d <= ON_SEG_TOL) onSeg.push(ni);
  }
  if (onSeg.length === 0) continue;

  // Sort on-seg nodes by position along the segment
  const dx = l.x2 - l.x1;
  const dy = l.y2 - l.y1;
  onSeg.sort((a, b) => {
    const ta = ((nodes[a].cx - l.x1) * dx + (nodes[a].cy - l.y1) * dy);
    const tb = ((nodes[b].cx - l.x1) * dx + (nodes[b].cy - l.y1) * dy);
    return ta - tb;
  });

  // Build chain: start endpoint -> on-seg nodes -> end endpoint
  const points = [{ x: l.x1, y: l.y1, idx: null }];
  for (const ni of onSeg) points.push({ x: nodes[ni].cx, y: nodes[ni].cy, idx: ni });
  points.push({ x: l.x2, y: l.y2, idx: null });

  // Create edges between consecutive points that both snap to nodes
  for (let pi = 0; pi < points.length - 1; pi++) {
    const p1 = points[pi];
    const p2 = points[pi + 1];
    const a = nearestNode(p1.x, p1.y);
    const b = nearestNode(p2.x, p2.y);
    if (a.d <= NODE_SNAP_TOL && b.d <= NODE_SNAP_TOL && a.idx !== b.idx) {
      splitEdges.push({
        fromIdx: a.idx, toIdx: b.idx,
        type: "corridor_segment",
        x1: p1.x, y1: p1.y, x2: p2.x, y2: p2.y,
      });
    }
  }
}

// ---------- Finalize edges: merge candidate + split, dedupe ----------
const edgeKey = (a, b) => a < b ? `${a}-${b}` : `${b}-${a}`;
const edgeSet = new Set();
const edges = [];

const finalizeEdge = (fromIdx, toIdx, type, distVal) => {
  if (fromIdx === toIdx) return;
  const k = edgeKey(fromIdx, toIdx);
  if (edgeSet.has(k)) return;
  edgeSet.add(k);
  edges.push({
    from: nodeMap.get(fromIdx),
    to: nodeMap.get(toIdx),
    type,
    distance: Math.round(distVal * 100) / 100,
    accessible: true,
  });
};

// Add split corridor edges first (they replace the long corridor lines)
const splitEdgeKeys = new Set();
for (const e of splitEdges) {
  finalizeEdge(e.fromIdx, e.toIdx, e.type, dist(e.x1, e.y1, e.x2, e.y2));
  splitEdgeKeys.add(edgeKey(e.fromIdx, e.toIdx));
}

// Add candidate edges (skip those already covered by splits, skip unmatched)
let matchedEdges = 0;
let unmatchedEdges = 0;
for (const c of candidateEdges) {
  const k = edgeKey(c.fromIdx, c.toIdx);
  if (splitEdgeKeys.has(k)) continue;
  if (c.fromD > NODE_SNAP_TOL || c.toD > NODE_SNAP_TOL) {
    unmatchedEdges++;
    continue;
  }
  finalizeEdge(c.fromIdx, c.toIdx, c.type, dist(c.x1, c.y1, c.x2, c.y2));
  matchedEdges++;
}

console.log(`\nEdges:`);
console.log("  corridor-split edges:", splitEdges.length);
console.log("  matched endpoint edges:", matchedEdges);
console.log("  unmatched (endpoint > tol):", unmatchedEdges);
console.log("  total unique edges:", edges.length);

// Compute node_type: junction if degree > 2
const degree = new Map();
for (const e of edges) {
  degree.set(e.from, (degree.get(e.from) || 0) + 1);
  degree.set(e.to, (degree.get(e.to) || 0) + 1);
}
for (const r of nodeRecords) {
  const deg = degree.get(r.id) || 0;
  r.node_type = deg > 2 ? "junction" : "pathway";
}

// ---------- Validation ----------
const issues = [];

// Duplicate node IDs
const nodeIds = nodeRecords.map(r => r.id);
const dupNodeIds = [...new Set(nodeIds.filter((id, i) => nodeIds.indexOf(id) !== i))];
if (dupNodeIds.length) issues.push({ check: "duplicate_node_ids", ids: dupNodeIds });

// Duplicate edge IDs (we generate sequential E001.. below, so none by construction)
// Missing node references
const nodeIdSet = new Set(nodeIds);
const missingRefs = [];
for (const e of edges) {
  if (!nodeIdSet.has(e.from)) missingRefs.push({ edge: e, ref: e.from });
  if (!nodeIdSet.has(e.to)) missingRefs.push({ edge: e, ref: e.to });
}
if (missingRefs.length) issues.push({ check: "missing_node_references", count: missingRefs.length });

// Disconnected nodes (degree 0)
const disconnected = nodeRecords.filter(r => !degree.has(r.id));
if (disconnected.length)
  issues.push({ check: "disconnected_nodes", count: disconnected.length, nodes: disconnected.map(r => ({ id: r.id, x: r.x, y: r.y })) });

// Invalid coordinates (outside viewBox 0 0 6223 4087 or NaN)
const invalidCoords = nodeRecords.filter(r => !isFinite(r.x) || !isFinite(r.y) || r.x < 0 || r.y < 0 || r.x > 6223 || r.y > 4087);
if (invalidCoords.length) issues.push({ check: "invalid_coordinates", count: invalidCoords.length });

// Unmatched pathway connections (green lines/paths with endpoints not snapping to nodes)
const unmatchedDetails = [];
for (const c of candidateEdges) {
  const k = edgeKey(c.fromIdx, c.toIdx);
  if (splitEdgeKeys.has(k)) continue;
  if (c.fromD > NODE_SNAP_TOL || c.toD > NODE_SNAP_TOL) {
    unmatchedDetails.push({
      x1: c.x1, y1: c.y1, x2: c.x2, y2: c.y2,
      fromD: c.fromD, toD: c.toD,
      nearestFrom: c.fromIdx !== null ? nodeRecords.find(r => nodeMap.has(r.id) && false) : null,
    });
  }
}
if (unmatchedDetails.length)
  issues.push({ check: "pathway_without_node", count: unmatchedDetails.length, details: unmatchedDetails.slice(0, 30) });

// Black lines (door swings / non-walkable)
if (blackLines.length)
  issues.push({ check: "non_walkable_black_lines", count: blackLines.length, note: "door swings / architectural details, excluded from walkable edges" });

// Big r=50 circles (candidate zone anchors, not connected)
if (bigCircles.length)
  issues.push({ check: "unconnected_big_circles", count: bigCircles.length, nodes: bigCircles, note: "candidate zone anchors / entrances, not connected to pathway network" });

// Floor assignment provisional flag
issues.push({ check: "floor_assignment_provisional", note: "No <text> elements in SVG; floor labels are outlined glyphs. Building/floor assigned by spatial zone (AB=left x<2500, MB=right x>=2500; floor by Y band). Needs manual verification." });

// ---------- Assign edge IDs ----------
edges.sort((a, b) => {
  const af = nodeRecords.findIndex(r => r.id === a.from);
  const bf = nodeRecords.findIndex(r => r.id === b.from);
  if (af !== bf) return af - bf;
  const at = nodeRecords.findIndex(r => r.id === a.to);
  const bt = nodeRecords.findIndex(r => r.id === b.to);
  return at - bt;
});
edges.forEach((e, i) => { e.id = `E${String(i + 1).padStart(3, "0")}`; });

// ---------- Build output files ----------
const navigationGraph = {
  generated_from: "assets/maps/navigation_graph.svg",
  viewBox: [0, 0, 6223, 4087],
  node_count: nodeRecords.length,
  edge_count: edges.length,
  nodes: nodeRecords,
  edges: edges.map(e => ({ id: e.id, from: e.from, to: e.to, distance: e.distance, accessible: e.accessible })),
};

const nodeMapping = {
  generated_from: SVG_PATH,
  total_nodes: nodeRecords.length,
  id_sequence: "N001..N164",
  mapping: nodeRecords.map(r => ({
    node_id: r.id,
    svg_x: r.x,
    svg_y: r.y,
    building_id: r.building_id,
    floor_id: r.floor_id,
    node_type: r.node_type,
  })),
};

const edgeMapping = {
  generated_from: SVG_PATH,
  total_edges: edges.length,
  id_sequence: `E001..E${String(edges.length).padStart(3, "0")}`,
  mapping: edges.map(e => ({
    edge_id: e.id,
    from: e.from,
    to: e.to,
    distance: e.distance,
    accessible: e.accessible,
    type: e.type,
  })),
};

const validationReport = {
  generated_from: SVG_PATH,
  node_count: nodeRecords.length,
  edge_count: edges.length,
  checks_passed: issues.length === 0,
  issues,
  summary: {
    duplicate_node_ids: dupNodeIds.length,
    missing_node_references: missingRefs.length,
    disconnected_nodes: disconnected.length,
    invalid_coordinates: invalidCoords.length,
    pathway_without_node: unmatchedDetails.length,
    non_walkable_black_lines: blackLines.length,
    unconnected_big_circles: bigCircles.length,
  },
  notes: [
    "Floor/building assignments are provisional (no <text> elements in SVG; labels are outlined glyphs).",
    "Black lines (door swings) excluded from walkable edges.",
    "3 big r=50 circles are candidate zone anchors, not connected to the pathway network.",
  ],
};

// ---------- Write files ----------
fs.mkdirSync(OUT_DIR, { recursive: true });

fs.writeFileSync(path.join(OUT_DIR, "navigation_graph.json"), JSON.stringify(navigationGraph, null, 2));
fs.writeFileSync(path.join(OUT_DIR, "node_mapping.json"), JSON.stringify(nodeMapping, null, 2));
fs.writeFileSync(path.join(OUT_DIR, "edge_mapping.json"), JSON.stringify(edgeMapping, null, 2));
fs.writeFileSync(path.join(OUT_DIR, "graph_validation_report.json"), JSON.stringify(validationReport, null, 2));

console.log(`\nWritten files to ${OUT_DIR}/:`);
console.log("  navigation_graph.json");
console.log("  node_mapping.json");
console.log("  edge_mapping.json");
console.log("  graph_validation_report.json");
