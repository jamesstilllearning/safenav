import fs from "fs";

const svg = fs.readFileSync("assets/maps/navigation_graph.svg", "utf8");
const lines = svg.split("\n");

const attr = (s, name) => {
  const m = s.match(new RegExp(`${name}="([^"]*)"`));
  return m ? m[1] : null;
};

const nodes = []; // {cx, cy}
const greenStraight = []; // {x1,y1,x2,y2}
const greenCurved = [];   // {d}
const blackLines = [];
const bigCircles = []; // r=50

for (const line of lines) {
  const t = line.trim();
  if (!t.startsWith("<")) continue;
  if (t.startsWith("<circle")) {
    const fill = attr(t, "fill"), r = +attr(t, "r");
    if (fill === "#338C18" && r === 12) nodes.push({ cx: +attr(t, "cx"), cy: +attr(t, "cy") });
    if (fill === "#D7FFCD" && r === 50) bigCircles.push({ cx: +attr(t, "cx"), cy: +attr(t, "cy") });
  } else if (t.startsWith("<line") && attr(t, "stroke") === "#338C18") {
    greenStraight.push({ x1: +attr(t, "x1"), y1: +attr(t, "y1"), x2: +attr(t, "x2"), y2: +attr(t, "y2") });
  } else if (t.startsWith("<line") && attr(t, "stroke") === "black") blackLines.push(t);
  else if (t.startsWith("<path")) {
    const stroke = attr(t, "stroke");
    const d = attr(t, "d") || "";
    if (stroke === "#338C18") greenCurved.push({ d });
  }
}

const TOL = 12;
const dist = (a, b) => Math.hypot(a.x - b.x, a.y - b.y);
const nearestNode = (x, y) => {
  let best = null, bestD = Infinity;
  for (const n of nodes) {
    const d = Math.hypot(n.cx - x, n.cy - y);
    if (d < bestD) { bestD = d; best = n; }
  }
  return { node: best, d: bestD };
};

console.log("nodes:", nodes.length, "bigCircles:", bigCircles.length);
console.log("green straight lines:", greenStraight.length, "green curved paths:", greenCurved.length, "black lines:", blackLines.length);

// --- endpoint snapping for straight lines ---
let matched = 0, unmatched = 0;
const endpointIssues = [];
for (const l of greenStraight) {
  const a = nearestNode(l.x1, l.y1);
  const b = nearestNode(l.x2, l.y2);
  if (a.d > TOL || b.d > TOL) {
    unmatched++;
    endpointIssues.push({ line: l, a: a.node, ad: a.d, b: b.node, bd: b.d });
  } else matched++;
}
console.log(`\nstraight lines: matched endpoints=${matched}, unmatched=${unmatched}`);
for (const e of endpointIssues) {
  console.log(`  unmatched: (${e.line.x1},${e.line.y1})->(${e.line.x2},${e.line.y2}) nearestA=(${e.a?.cx?.toFixed?.(1)},${e.a?.cy?.toFixed?.(1)}) d=${e.ad?.toFixed?.(1)} nearestB=(${e.b?.cx?.toFixed?.(1)},${e.b?.cy?.toFixed?.(1)}) d=${e.bd?.toFixed?.(1)}`);
}

// --- corridor splitting: nodes lying ON a straight line segment ---
const pointOnSeg = (px, py, x1, y1, x2, y2, tol = 10) => {
  const cross = (px - x1) * (y2 - y1) - (py - y1) * (x2 - x1);
  if (Math.abs(cross) > tol) return false;
  const dot = (px - x1) * (x2 - x1) + (py - y1) * (y2 - y1);
  const len2 = (x2 - x1) ** 2 + (y2 - y1) ** 2;
  return dot >= -tol && dot <= len2 + tol;
};

let corridorSegments = 0;
const nodesOnLines = new Set();
for (const l of greenStraight) {
  const onLine = [];
  for (let i = 0; i < nodes.length; i++) {
    const n = nodes[i];
    if (pointOnSeg(n.cx, n.cy, l.x1, l.y1, l.x2, l.y2, 10)) onLine.push(i);
  }
  onLine.sort((a, b) => {
    const ta = ((nodes[a].cx - l.x1) * (l.x2 - l.x1) + (nodes[a].cy - l.y1) * (l.y2 - l.y1));
    const tb = ((nodes[b].cx - l.x1) * (l.x2 - l.x1) + (nodes[b].cy - l.y1) * (l.y2 - l.y1));
    return ta - tb;
  });
  // endpoints snapped to nodes too
  corridorSegments += Math.max(0, onLine.length - 1);
  for (const i of onLine) nodesOnLines.add(i);
}
console.log(`\ncorridor line segments between intermediate nodes: ${corridorSegments}`);
console.log(`nodes lying on at least one straight green line: ${nodesOnLines.size}`);

// --- disconnected nodes (no straight line endpoint and not on any line) ---
const endpointNodes = new Set();
for (const l of greenStraight) {
  const a = nearestNode(l.x1, l.y1); const b = nearestNode(l.x2, l.y2);
  if (a.d <= TOL) endpointNodes.add(nodes.indexOf(a.node));
  if (b.d <= TOL) endpointNodes.add(nodes.indexOf(b.node));
}
// curved path endpoints
for (const p of greenCurved) {
  const nums = p.d.match(/[MmLl]?\s*([\d.]+)\s*,?\s*([\d.]+)/g);
  // crude: first and last coordinate pairs
  const pairs = p.d.match(/([\d.]+)\s+([\d.]+)/g);
  if (pairs) {
    const first = pairs[0].split(/\s+/).map(Number);
    const last = pairs[pairs.length - 1].split(/\s+/).map(Number);
    const a = nearestNode(first[0], first[1]);
    const b = nearestNode(last[0], last[1]);
    if (a.d <= TOL) endpointNodes.add(nodes.indexOf(a.node));
    if (b.d <= TOL) endpointNodes.add(nodes.indexOf(b.node));
  }
}
const disconnected = nodes.map((n, i) => n).filter((_, i) => !endpointNodes.has(i) && !nodesOnLines.has(i));
console.log(`\nendpoint nodes (straight+curved): ${endpointNodes.size}`);
console.log(`DISCONNECTED nodes: ${disconnected.length}`);
for (const n of disconnected.slice(0, 40)) console.log(`  (${n.cx}, ${n.cy})`);
if (disconnected.length > 40) console.log(`  ... and ${disconnected.length - 40} more`);

// --- big circles connectivity ---
console.log(`\nbig r=50 circles:`);
for (const c of bigCircles) {
  const a = nearestNode(c.cx, c.cy);
  console.log(`  (${c.cx}, ${c.cy}) nearest green node d=${a.d.toFixed(1)}`);
}

// --- node distribution by rough zone ---
const zones = {
  "top-left (x<2500, y<2200)": 0,
  "top-mid (2500-4100, y<2200)": 0,
  "mid-right (2600-5500, 2000-3300)": 0,
  "lower-right (y>2800)": 0,
  "other": 0,
};
for (const n of nodes) {
  if (n.cx < 2500 && n.cy < 2200) zones["top-left (x<2500, y<2200)"]++;
  else if (n.cx >= 2500 && n.cx < 4100 && n.cy < 2200) zones["top-mid (2500-4100, y<2200)"]++;
  else if (n.cx >= 2600 && n.cx < 5500 && n.cy >= 2000 && n.cy < 3300) zones["mid-right (2600-5500, 2000-3300)"]++;
  else if (n.cy >= 2800) zones["lower-right (y>2800)"]++;
  else zones["other"]++;
}
console.log(`\nnode spatial distribution:`);
for (const [k, v] of Object.entries(zones)) console.log(`  ${k}: ${v}`);
