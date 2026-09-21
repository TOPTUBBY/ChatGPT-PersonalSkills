---
name: engineering-troubleshooting
description: Systematically troubleshoot engineering failures across software, test sequence, wiring, communication, equipment, power, environment, and setup. Use for intermittent faults, test down events, unexpected measurements, setup failures, and root-cause analysis where evidence-driven isolation is required.
---

# Engineering Troubleshooting

Use a repeatable evidence-based method instead of trial-and-error.

## Core framework

**Define Problem → Collect Evidence → Isolate Cause → Verify → Prevent**

## Required workflow

1. **Define the failure precisely.** Capture expected behavior, actual behavior, first occurrence, frequency, operating state, affected channel/device, and the smallest reproducible case.
2. **Freeze the baseline.** Record software/firmware version, test sequence, wiring revision, equipment model, configuration, environmental conditions, sampling rate, and recent changes.
3. **Collect evidence before changing things.** Prefer logs, error codes, oscilloscope traces, CAN traces, voltage/current measurements, temperatures, timestamps, photos, and configuration exports.
4. **Split the fault domain.** Classify likely causes into software, sequence/timing, communication, wiring/connectors, equipment, power, environment, or DUT.
5. **Start with quick/low-risk checks.** Verify power, physical connections, channel mapping, configuration, communication health, obvious alarms, and known-good references.
6. **Change one variable at a time.** Swap only one cable, channel, module, configuration, device, or software component per experiment.
7. **Use A/B comparison.** Compare failing vs known-good hardware, channel, software version, project, or setup whenever possible.
8. **Verify the root cause.** Reproduce the failure, apply the proposed correction, then demonstrate that the same trigger no longer causes the issue.
9. **Check regressions.** Confirm the fix did not break adjacent functions or another channel/test mode.
10. **Prevent recurrence.** Add checklist items, alarms, limits, documentation, code guards, monitoring, training, or setup poka-yoke.

## Evidence table

For complex issues, maintain a compact table:

| Item | Expected | Actual | Evidence | Interpretation |
|---|---|---|---|---|
| Power | nominal/stable | measured value | meter/log | pass/fail |
| Communication | periodic valid frames | observed trace | CAN/serial log | pass/fail |
| Command | correct target/state | response | command log | pass/fail |
| Hardware path | known-good continuity | measured | DMM/scope | pass/fail |

## Isolation techniques

- Known-good substitution
- Channel swapping
- Software rollback
- Minimal test sequence
- Disable one cyclic/background task at a time
- Separate read and write timing
- Loopback or simulator test
- Standalone equipment test
- Independent measurement instrument
- Stress vs idle comparison

## Communication style

When reporting the issue, structure the result as:

**Problem → Evidence → Root Cause/Hypothesis → Action → Result → Prevention/Next Step**

State uncertainty explicitly. Do not label a hypothesis as root cause until verified.

## Safety

For high voltage, mains, regenerative power, thermal chambers, pressurized systems, or moving equipment, put safe isolation and measurement boundaries ahead of troubleshooting speed. Do not recommend bypassing interlocks or protection just to reproduce a fault.
