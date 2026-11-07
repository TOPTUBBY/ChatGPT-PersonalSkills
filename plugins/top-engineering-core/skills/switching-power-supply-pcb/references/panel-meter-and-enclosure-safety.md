# Panel meter, banana jack, and metal enclosure verification

## Unknown 3-wire panel meters
Wire colors are not a reliable pinout. Before connecting a meter, obtain its exact manufacturer diagram and determine whether current sensing is high-side, low-side, or through an internal shunt. Some three-wire meters share supply and measurement grounds; miswiring can short the output.

With power off, measure resistance/continuity between every pair of leads. This is **screening**, not proof of safe connection. Then test using an isolated current-limited low-voltage supply and a sacrificial load. Confirm meter power range, common-mode limits, maximum current and shunt dissipation. Never assume a floating measurement lead is safe to tie to output positive.

## Metal enclosure
- Bond protective earth to the metal chassis with a dedicated secure connection per applicable electrical standards. Protective earth is not a substitute for output negative.
- Use insulating shoulder washers/bushings for banana jacks and potentiometer shafts when output isolation from chassis is required; verify with continuity after tightening.
- Protect wiring at cutouts with grommets, strain relief and suitable clearances; keep mains wiring segregated from low-voltage control.
- For fused AC inlet → switch → PSU, follow the rated switch/inlet terminal diagram and local electrical code; fuse and switch the appropriate live conductor(s), and do not interrupt protective earth.
- Verify fuse type/rating, wire gauge, insulation temperature rating, earth continuity and accessible-metal safety before energizing.

## Thermal and load checks
Inductor heating under load can indicate copper loss, saturation, inadequate current rating or poor airflow. Record temperature rise vs current, input voltage and ripple; inspect saturation-current and RMS-current specifications, not inductance alone. For passive loads use `R = V/I`, `P = V×I`, with resistor power derating and safe ventilation.

## Acceptance tests
Check chassis-earth continuity, output-to-chassis isolation where designed, no unintended jack-to-panel short, mains strain relief, load regulation, ripple with short probe ground, current-limit response, and thermal steady state. Do not claim compliance from visual inspection alone.
