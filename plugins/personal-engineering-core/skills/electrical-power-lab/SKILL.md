---
name: electrical-power-lab
description: Analyze electrical laboratory power systems involving 3-phase star/delta distribution, AC sources, regenerative loads/sources, breaker coordination, neutral current, harmonics, cable heating, standby consumption, and power-flow measurements. Use for lab power incidents, protection questions, regeneration paths, and electrical measurement planning.
---

# Electrical Power Lab

Treat lab power questions as a system problem: source, distribution, protection, load, regeneration, harmonics, wiring, and measurement all matter.

## Analysis sequence

1. Draw a one-line diagram.
2. Mark voltage system and connection:
   - phase-phase
   - phase-neutral
   - star/delta
   - neutral presence
3. Mark every device as:
   - consuming only
   - regenerative/bidirectional
   - grid simulator/source
4. Add breaker ratings, cable sizes, conductor lengths, neutral size, PDU topology, and grounding.
5. Measure current per phase and neutral; do not infer safety from net power alone.
6. Check waveform quality/harmonics with appropriate power analysis equipment when nonlinear loads are involved.
7. Check protection selectivity and actual trip curves, not only breaker ampere labels.

## Regenerative systems

A low net current at the upstream point does **not** imply low branch current. One branch can draw high current while another regenerates into the same bus.

Always distinguish:
- branch RMS current
- upstream net power/current
- circulating/regenerative power
- phase imbalance
- neutral current

## Neutral and triplen harmonics

In 3-phase 4-wire systems, balanced fundamental phase currents largely cancel in the neutral. Triplen harmonics such as the 3rd can be zero-sequence components and add in the neutral instead of cancelling.

Do not assume a neutral problem is present merely because a system is 3-phase. Confirm with current waveform/harmonic measurement and identify which loads create nonlinear phase-neutral current.

## Breaker/cable incident analysis

If a cable or PDU overheats before the expected breaker isolates:
- inspect actual breaker curve and instantaneous region
- verify conductor ampacity and termination torque
- inspect contact resistance and localized heating
- check ambient/bundling derating
- measure harmonic RMS current
- check neutral loading
- verify breaker coordination/selectivity
- inspect upstream/downstream fault current capability
- verify that regenerative equipment changes current paths as expected

## Energy-use analysis

For standby fleets, measure real power per device and aggregate annual energy, not only current. Consider sleep/remote-off capability, restart behavior, automation impact, and recovery requirements before implementing energy-saving shutdowns.

## Safety boundary

Do not bypass breakers, interlocks, protective earth, or safety relays. Measurements on mains or HV systems must use appropriately rated instruments, probes, PPE, isolation, and authorized procedures.
