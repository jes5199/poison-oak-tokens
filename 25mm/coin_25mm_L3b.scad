// 25mm POISON-OAK coin — single-vein (L3b) bead variant (jes 2026-07-15)
//
// The 20mm L3b-Ø3.0 design (coin_20mm_bead_L3b_deep.scad @87c870b) scaled
// 1.25x to Ø25mm, twine hole NOT scaled:
//
//  * Scaled 1.25x: motif, border (raised ring 10.875..12.5mm to the rim,
//    1.63mm wide; back engraved ring 10.875..12.1mm + 0.4mm flat land),
//    the three L3b midrib strokes (0.65 -> 0.81mm, still print-safe).
//  * Kept fixed: hole Ø3.00mm and the deep relief (leaf plateau +0.60,
//    border +0.80, vein grooves 0.80 deep, back drawing 0.60 — heights
//    don't scale for printing; layer-exact at 0.2mm).
//  * Hole on the stem's fitted axis at (+0.754, 9.345): top edge TANGENT to
//    the border's inner edge at r=10.875 — zero bite, both faces. At this
//    size the fixed hole sits near the stem tip (eats 0.16mm — the stem
//    kisses the hole; jes approved as-is). Back motif mirror rotated
//    -9.22deg so the back stem's axis also passes through the hole.
//
// Self-contained: renders coin_25mm_L3b.stl as accepted. 200px heightmaps
// = the same mm/px relief sampling as the 20mm coins' 160px maps.

diameter = 25;
total_h  = 3.20;                   // face 2.40 + border 0.80
hmfile   = "heightmap_25mm_L3b.png";
img      = 200;

back_hm    = "heightmap_back_25mm_L3b.png";
back_depth = 0.60;

hole_dia = 3.0;
hole_cx  = 0.754;                  // on the stem axis; top edge tangent to the border
hole_cy  = 9.345;

flip = false;                      // true = show the underside face up

$fn = 240;

module coin() {
    difference() {
        intersection() {
            scale([diameter/(img-1), diameter/(img-1), total_h/255])
                surface(file = hmfile, center = true, invert = false);
            cylinder(h = total_h * 2 + 2, d = diameter, center = true);
        }
        scale([diameter/(img-1), diameter/(img-1), back_depth/255])
            surface(file = back_hm, center = true, invert = false);
        translate([hole_cx, hole_cy, 0])
            cylinder(h = total_h * 4, d = hole_dia, center = true, $fn = 48);
    }
}

if (flip) rotate([0, 180, 0]) coin();
else coin();
