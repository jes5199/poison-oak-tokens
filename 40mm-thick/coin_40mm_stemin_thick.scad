// 40mm POISON-OAK coin — THICK+DEEP bead variant (jes 2026-07-15, STL-only)
//
// The v3 stem-in design scaled 2x to Ø40mm, with the twine hole NOT scaled:
//
//  * Motif + border scaled 2x: raised border ring 17.4..20.0mm on the front
//    (runs to the coin rim, no flat lip, now 2.6mm wide); back engraved ring
//    17.4..19.6mm leaving the 0.4mm flat LAND at the rim (clean back-face-down
//    print). Relief depths KEPT (2.85mm coin, +0.40 leaf, -0.30 veins, +0.45
//    border, 0.40 back grooves — heights don't scale for printing).
//  * THICK: whole coin doubled to 5.70mm total (face field 4.90mm).
//  * DEEP relief on the bold-width art (0.77mm strokes): leaf plateau +0.60,
//    border +0.80, front grooves 0.80 deep (floor 0.20 below the face),
//    back drawing 0.80 deep. All exact 0.2mm-layer multiples.
//  * Hole KEPT at a fixed twine size, Ø3.00mm, centred on the STEM'S fitted
//    axis at the MIDPOINT of stem-tip -> border-inner-edge: (+1.218, 15.074).
//    Fully clean: 0.77mm gap to the stem tip, 0.78mm to the border wall,
//    leaflets 3.78mm. Web to the rim: 0.78mm face + 2.6mm full-height border.
//  * Back motif = mirror ROTATED -9.24deg so the back stem's own axis also
//    passes through the hole (hole on the stem line on BOTH faces).
//
// Self-contained: renders coin_40mm_stemin_thick.stl as accepted.
// Heightmaps (320px, matching the 20mm coins' relief sampling) baked by
// gen_coin40.py from source_leaf.jpg.

diameter = 40;
total_h  = 5.70;                   // THICK: 2x base (face 4.90) + 0.80 border
hmfile   = "heightmap_40mm_stemin_thick.png";
img      = 320;

back_hm    = "heightmap_back_40mm_stemin_thick.png";
back_depth = 0.80;                 // DEEP back drawing

hole_dia = 3.0;
hole_cx  = 1.218;                  // midpoint of stem-tip -> border wall, on the axis
hole_cy  = 15.074;

flip = false;                      // true = show the underside face up

$fn = 280;

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
            cylinder(h = total_h * 4, d = hole_dia, center = true, $fn = 64);
    }
}

if (flip) rotate([0, 180, 0]) coin();
else coin();
