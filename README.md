# Poison-Oak Tokens

Physical tokens to help Scouts learn to recognize poison oak by its
leaves-of-three shape — a safe, touchable way to study the plant, given as a
reward for learning to spot it in the field.

Each token is a printable coin/bead bearing a trifoliate poison-oak leaf,
traced from a real leaf illustration. Three final designs, each
a self-contained OpenSCAD model: the `.scad` plus the two grayscale heightmaps
in its folder reproduce the STL exactly.

| Token | Design | Hole | Thickness |
|---|---|---|---|
| **20 mm** (`20mm/`) | No-veins: clean raised leaf silhouettes | Ø3.0 mm | 3.20 mm |
| **25 mm** (`25mm/`) | Single-vein: one midrib stroke per leaflet | Ø3.0 mm | 3.20 mm |
| **40 mm** (`40mm/`) | Full veins, bold strokes, on a chunky 5.70 mm deep-relief body | Ø3.0 mm | 5.70 mm |

Every token is a **bead**: a vertical through-hole sits on the stem's own
implied axis (the leaf leans ~5.8° — the hole follows the stem line, not the
coin's centerline), sized for twine and placed tangent to the raised border so
it never cuts the edge ring. The **front** face is an embossed leaf medallion
(raised silhouette, debossed veins, raised border ring running to the rim).
The **back** face is the same leaf engraved as line art, mirrored *and rotated*
so the hole lands on the stem line on both faces, with a thin flat land at the
rim for a clean first layer.

## Folder contents

Each size folder holds:

- `source_leaf.jpg` — the reference photograph the line art was extracted from
  (black-hat morphology → line art → grayscale heightmaps)
- `coin_*.scad` — self-contained OpenSCAD model (reads the heightmaps beside it)
- `heightmap_*.png` / `heightmap_back_*.png` — front relief and back engraving maps
- `coin_*.stl` — the exact accepted mesh (manifold)
- `renders/` — flat "what-prints" views of both faces plus 3D renders
  (top-down, perspective, angled, and the flipped back face)

To rebuild an STL from source:

```
cd 20mm && openscad -o coin_20mm_bead_noveins.stl coin_20mm_bead_noveins.scad
```

## Printing

Designed and validated for **PLA, 0.4 mm nozzle, 0.1 mm layers** (Prusa-class
FDM). Print the **back face down, no supports** — the back's engraved line art
gives a crisp flat first layer (thin grooves bridge cleanly), and the raised
front medallion prints face-up with no overhangs.

Feature sizes were chosen around real slicer behavior, learned the hard way on
early prints:

- **Debossed grooves are ≥ 2 extrusion lines wide.** A slicer needs roughly two
  0.4 mm lines (~0.85 mm; ≥0.62 mm workable with tuning) to form a slot with
  clean walls — thinner slots get skipped or smeared. The 40 mm token's vein
  grooves are 0.77 mm; the 25 mm token's single midrib strokes are 0.81 mm.
- **Relief depths are exact layer multiples.** Groove depth 0.80 mm and leaf
  relief +0.60 mm are whole layer counts at 0.1 mm (8 and 6 layers) — and at
  0.2 mm too, if you print coarser. (An early 0.30 mm groove printed at 0.2 mm
  layers quantized to a single visible layer and vanished — depth, not width,
  is the first thing a print loses.)
- **Relief height does not scale with diameter.** The larger tokens scale the
  artwork in XY only; the Z stack stays printable at any size. (The 40 mm
  doubles the *body* to 5.70 mm with deepened relief — grooves 0.80 mm,
  leaf +0.60 mm, border +0.80 mm — for a chunky, high-contrast coin.)
- **The bead hole never weakens the edge:** its top edge is tangent to the
  border ring's inner edge, so the full-height border runs unbroken between
  hole and rim.

If your top-surface art comes out soft, use the Arachne perimeter generator,
a 0.40–0.42 mm external perimeter width, slower outer perimeters, and ironing
**off**.

## License

Released under **CC0 1.0** (public domain) — see [LICENSE](LICENSE).
