import fs from "fs";

const svg = fs.readFileSync("assets/maps/navigation_graph.svg", "utf8");
const lines = svg.split("\n");

const circles = [];
const lines_ = [];
const rects = [];
const paths = [];
let totalPaths = 0;
let curvedPaths = 0;
let straightPaths = 0;

const attr = (s, name) => {
  const m = s.match(new RegExp(`${name}="([^"]*)"`));
  return m ? m[1] : null;
};

for (const line of lines) {
  const trimmed = line.trim();
  if (!trimmed.startsWith("<")) continue;

  if (trimmed.startsWith("<circle")) {
    circles.push({
      cx: +attr(trimmed, "cx"),
      cy: +attr(trimmed, "cy"),
      r: +attr(trimmed, "r"),
      fill: attr(trimmed, "fill"),
      stroke: attr(trimmed, "stroke"),
    });
  } else if (trimmed.startsWith("<line")) {
    lines_.push({
      x1: +attr(trimmed, "x1"),
      y1: +attr(trimmed, "y1"),
      x2: +attr(trimmed, "x2"),
      y2: +attr(trimmed, "y2"),
      stroke: attr(trimmed, "stroke"),
      strokeWidth: attr(trimmed, "stroke-width"),
    });
  } else if (trimmed.startsWith("<rect")) {
    rects.push({
      x: +attr(trimmed, "x"),
      y: +attr(trimmed, "y"),
      w: +attr(trimmed, "width"),
      h: +attr(trimmed, "height"),
      rx: attr(trimmed, "rx") ? +attr(trimmed, "rx") : null,
      fill: attr(trimmed, "fill"),
      stroke: attr(trimmed, "stroke"),
    });
  } else if (trimmed.startsWith("<path")) {
    const d = attr(trimmed, "d") || "";
    const fill = attr(trimmed, "fill");
    const stroke = attr(trimmed, "stroke");
    const strokeWidth = attr(trimmed, "stroke-width");
    const hasCurve = /[CQS]/.test(d);
    if (hasCurve) curvedPaths++;
    else straightPaths++;
    totalPaths++;
    paths.push({
      d,
      fill,
      stroke,
      strokeWidth,
      hasCurve,
      len: d.length,
    });
  }
}

console.log("=== COUNTS ===");
console.log("circles:", circles.length);
console.log("lines:", lines_.length);
console.log("rects:", rects.length);
console.log("paths:", totalPaths, "(curved:", curvedPaths, ", straight:", straightPaths, ")");

console.log("\n=== CIRCLE fill distribution ===");
const circFill = {};
for (const c of circles) circFill[c.fill] = (circFill[c.fill] || 0) + 1;
console.log(circFill);

console.log("\n=== r=12 green circles (navigation markers) ===");
const green12 = circles.filter(c => c.fill === "#338C18" && c.r === 12);
console.log("count:", green12.length);
for (const c of green12) console.log(`  (${c.cx}, ${c.cy})`);

console.log("\n=== r=50 light-green circles ===");
const bigLight = circles.filter(c => c.fill === "#D7FFCD" && c.r === 50);
console.log("count:", bigLight.length);
for (const c of bigLight) console.log(`  (${c.cx}, ${c.cy})`);

console.log("\n=== Other circles ===");
const otherCirc = circles.filter(c => !(c.fill === "#338C18" && c.r === 12) && !(c.fill === "#D7FFCD" && c.r === 50));
console.log("count:", otherCirc.length);
for (const c of otherCirc) console.log(`  r=${c.r} fill=${c.fill} (${c.cx}, ${c.cy})`);

console.log("\n=== LINE stroke distribution ===");
const lineStroke = {};
for (const l of lines_) lineStroke[l.stroke] = (lineStroke[l.stroke] || 0) + 1;
console.log(lineStroke);

console.log("\n=== Green lines (#338C18) ===");
const greenLines = lines_.filter(l => l.stroke === "#338C18");
console.log("count:", greenLines.length);
for (const l of greenLines) console.log(`  (${l.x1},${l.y1}) -> (${l.x2},${l.y2}) sw=${l.strokeWidth}`);

console.log("\n=== Black lines ===");
const blackLines = lines_.filter(l => l.stroke === "black");
console.log("count:", blackLines.length);
for (const l of blackLines) console.log(`  (${l.x1},${l.y1}) -> (${l.x2},${l.y2}) sw=${l.strokeWidth}`);

console.log("\n=== PATH stroke distribution ===");
const pathStroke = {};
for (const p of paths) pathStroke[p.stroke] = (pathStroke[p.stroke] || 0) + 1;
console.log(pathStroke);

console.log("\n=== Green paths (#338C18) ===");
const greenPaths = paths.filter(p => p.stroke === "#338C18");
console.log("count:", greenPaths.length);
for (const p of greenPaths) {
  console.log(`  sw=${p.strokeWidth} curve=${p.hasCurve} d_len=${p.len} d=${p.d.slice(0, 120)}`);
}

console.log("\n=== RECT fill distribution ===");
const rectFill = {};
for (const r of rects) rectFill[r.fill] = (rectFill[r.fill] || 0) + 1;
console.log(rectFill);

console.log("\n=== All rects ===");
for (const r of rects) {
  console.log(`  x=${r.x} y=${r.y} w=${r.w} h=${r.h} rx=${r.rx} fill=${r.fill} stroke=${r.stroke}`);
}

console.log("\n=== Black fill paths (outlined text candidates) ===");
const blackFillPaths = paths.filter(p => p.fill === "black" && !p.stroke);
console.log("count:", blackFillPaths.length);
// cluster by y position roughly
const clusters = [];
for (const p of blackFillPaths) {
  // crude: take first M coordinate as anchor
  const m = p.d.match(/M([\d.]+) ([\d.]+)/);
  if (m) {
    const y = +m[2];
    let placed = false;
    for (const c of clusters) {
      if (Math.abs(c.y - y) < 8) { c.items.push(p); placed = true; break; }
    }
    if (!placed) clusters.push({ y, items: [p] });
  }
}
clusters.sort((a, b) => a.y - b.y);
console.log("text-like clusters by y:", clusters.length);
for (const c of clusters) {
  console.log(`  y~${c.y.toFixed(0)} glyphs:${c.items.length}`);
}
