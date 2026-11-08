---
name: switching-power-supply-pcb
description: Design and troubleshoot low-voltage buck switching power supplies and two-layer PCBs, including LM2596 adjustable/fixed feedback, current limiting, shunt voltage drop, component ratings, EMI layout, ripple measurement, EasyEDA review, and safe load testing. Use for power regulator schematic/PCB review and fault isolation.
---

# Switching Power Supply & PCB Design

Treat a switching regulator as a power stage, feedback loop, protection circuit, PCB layout, and measurement system. Inspect the actual datasheets, schematic, BOM, PCB, and test conditions before diagnosing.

## Define specifications and feasibility

Document input minimum/maximum including transients, output adjustment range, current, efficiency, ripple target, thermal limits, and load dynamics. Check input/output headroom and component derating; divider calculations alone do not guarantee the requested output range.

Verify exact part numbers:
- LM2596 fixed-output and adjustable versions require different feedback connections; confirm package and pinout.
- Inductor inductance, saturation current, RMS current, and DCR; do not infer inductance from a misleading suffix.
- Diode reverse voltage, forward current, surge, and heat dissipation.
- Capacitor voltage, ESR, ripple-current, polarity, and temperature ratings.
- Sense resistor resistance, power rating, and thermal drift.

## Feedback and current limit

For a conventional adjustable divider:

```text
VOUT ≈ VREF × (1 + RTOP / RBOTTOM)
RTOP: VOUT to FB; RBOTTOM: FB to signal ground
```

LM2596-ADJ nominal VREF is approximately 1.23 V; verify the selected datasheet and tolerances. Analyze trimmer wiper failure, divider extremes, input headroom, and where output voltage is sensed.

For a shunt:

```text
VSHUNT = ILOAD × RSHUNT
PSHUNT = ILOAD² × RSHUNT
```

Example: 0.5 ohm at 2 A drops 1 V and dissipates 2 W, even if the buck stage regulates correctly. Separate intentional current limiting from shunt/wire drop, thermal shutdown, insufficient input headroom, and control instability.

When using LM358, verify two channels map to **one physical IC**: channel A pins 1/2/3, channel B pins 5/6/7, supplies 8/4 (confirm package datasheet). Check input common-mode, supply range, output swing, sense polarity, and response time. A 1 kohm + 100 nF RC filter has ideal cutoff about 1.59 kHz; validate that filtering does not make fault protection too slow.

## Two-layer PCB placement and routing

1. Place input bypass, regulator, diode, and return to minimize high-di/dt loop area.
2. Keep SW copper short/compact; avoid running feedback or sense traces near noisy SW/inductor nodes.
3. Place inductor/output capacitor to shorten the output power path and use appropriately sized copper.
4. Preserve low-impedance return paths and isolate sensitive analog sensing from power current loops.
5. Kelvin-route shunt sensing and route FB from the intended regulated output point.
6. Follow regulator/inductor guidance on ground-under-inductor keepouts; avoid arbitrary ground-plane cuts.
7. Check heat spreading, clearance, test points (VIN, GND, SW, FB, VOUT, sense), service access, and mounting.
8. Run ERC/DRC and verify footprint, pad spacing, polarity, copper pours, Gerbers, and 3D-model placement independently.

A generic 2 A trace-width rule is insufficient without copper weight, trace length, temperature rise, fabrication constraints, and ambient temperature.

## Safe bring-up and troubleshooting

With power removed, inspect polarity, shorts, ground paths, divider connections, component ratings, and package identity. Start with a current-limited source and a feasible low-risk input voltage. Record VIN, IIN, VOUT, FB, temperature, and no-load behavior. Increase load in measured steps; record output voltage at the actual terminals and distinguish source drop from regulator drop.

Do not validate multi-amp switching performance on a solderless breadboard. Contact resistance and parasitic inductance can distort ripple, create ground bounce, and cause heating.

## Ripple measurement

- Probe directly across output terminals/capacitor using a short ground spring or equivalent low-inductance connection.
- Record scope bandwidth limit, AC/DC coupling, probe attenuation, vertical scale, time base, and load.
- Compare identical probing setups before and after layout changes; distinguish spikes from lower-frequency oscillation.
- A long ground clip can exaggerate peak-to-peak ripple.
- Never attach an earth-referenced oscilloscope ground clip to mains or a floating high-side node; use appropriately rated differential/isolation methods.

## Completion checklist

Deliver verified BOM/rating issues, schematic net review, annotated switching/high-current loops, thermal and test-point review, DRC status, safe load-test procedure, and unresolved risks. Distinguish proposed designs from physically tested hardware.
