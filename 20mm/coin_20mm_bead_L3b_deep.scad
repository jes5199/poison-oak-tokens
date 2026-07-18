// 20mm POISON-OAK coin — BEAD v3 "STEM-IN" L3b MINIMAL-VEINS + DEEP variant (jes 2026-07-15)
//
// The v3 stem-in bead (coin_20mm_bead_v3_stemin.scad) with BOLD veins — the
// legibility fix after jes's first print. Recap of the v3 stem-in geometry:
//
//  * Border pushed OUT to the coin edge: front raised ring runs 8.7..10.0mm
//    (the flat lip is gone). Back engraved ring runs 8.7..9.6mm, leaving a
//    0.4mm flat LAND at the rim so the coin still prints clean back-face-down
//    (no undercut lip).
//  * Ø2.50 through-hole on the STEM'S fitted axis (x = 0.1024*y - 0.162, the
//    5.8deg-right lean), TANGENT to the border's inner edge at r=8.7 — the
//    hole touches the border, zero bite. Centre (+0.598, 7.426), so the hole
//    is held by the full-height 1.3mm border ring all the way to the edge.
//  * STEM-IN: the stem is NOT trimmed — it runs into the hole (tip's last
//    ~0.23mm swallowed), the pendant-loop look jes picked. Both faces: the
//    back motif is the mirror ROTATED -9.22deg so the back stem's own axis
//    also passes through the hole (leaflets clear 1.29mm both faces).
//
// L3b MINIMAL VEINS: exactly one stroke per leaflet — each leaflet's midrib
// traced junction->tip through the leaf's own vein tree, free-floating (no
// junction join), ~0.65mm strokes. Back drawing = leaf outline + the same
// three strokes (mirrored + rotated -9.22deg). DEEP relief as the 40mm that
// printed well: leaf plateau +0.60, border +0.80, front grooves 0.80 deep
// (floor 0.20 below the face), back drawing 0.60 deep. Layer-exact at 0.2mm.
// Self-contained: renders coin_20mm_bead_L3b_deep.stl as accepted.
// Heightmaps baked by gen_bead_v3.py from source_leaf.jpg.

diameter = 20;
total_h  = 3.20;                   // DEEP: face 2.40 + border 0.80
hmfile   = "heightmap_20mm_bead_L3b_deep.png";
img      = 160;

back_hm    = "heightmap_back_20mm_bead_L3b_deep.png";
back_depth = 0.60;                 // DEEP back drawing

hole_dia = 3.0;
hole_cx  = 0.572;                  // on the stem axis; top edge tangent to the border
hole_cy  = 7.177;                  // grown Ø2.5->3.0 DOWNWARD (jes): zero border bite kept

flip = false;                      // true = show the underside face up

$fn = 220;

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
