---
name: automotive-can-capl
description: Develop, teach, debug, and review automotive CAN/CANoe/CAPL/DBC/vTESTstudio workflows, including Classical CAN setup, signal/database validation, timing, long-duration measurements, Vector interface troubleshooting, logging, simulation, test automation, and equipment control through CANoe. Use for CAN communication, beginner CANoe training, CAPL test sequences, vTESTstudio tests, DBC integration, and Vector hardware issues.
---

# Automotive CAN / CANoe / CAPL / vTESTstudio

Build, explain, and troubleshoot CAN-based test systems with a strong separation between network, database, mapping, simulation, sequence, hardware interface, logging, and test layers.

## Beginner mental model

Teach the tool chain as a signal path rather than as isolated windows:

```text
Database / DBC
      ↓
CAN channel + mapping
      ↓
Simulation / node logic / CAPL
      ↓
System Variables + Panels
      ↓
Measurement + Logging
      ↓
vTESTstudio / automated test + evidence
```

For newcomers, expand abbreviations on first use and explain what each layer is for before showing menu operations. Connect every concept to a real use case: observe a signal, stimulate a node, control equipment, reproduce a fault, automate a manual check, or collect evidence.

## Core workflow

1. Confirm network fundamentals:
   - CAN type and bitrate
   - standard vs extended ID
   - termination
   - channel assignment
   - transceiver/piggy type
   - physical bus state
2. Validate DBC independently:
   - IDs
   - DLC
   - byte order
   - scaling/offset
   - units
   - cycle time
   - multiplexing
3. Verify the CANoe signal path in order:
   - database
   - channel/mapping
   - simulation/node logic
   - System Variables / panel
   - measurement/logging/test
4. Reproduce failures with the smallest configuration possible.
5. Compare against a known-good channel/interface when hardware is suspect.

## Troubleshooting signal flow

Use this sequence instead of random edits:

```text
Symptom → Source → Mapping → Logic → Output → Evidence
```

At each stage, prove whether the expected value/event exists before moving downstream. Change one variable at a time and retain evidence from the failing and corrected cases.

## CAPL timing

For long-running measurements, prefer 64-bit timing sources when ordinary timing APIs risk range/precision limitations.

Typical pattern:

```capl
Start_Time_s = (float)((double)timeNowInt64() / 1e9);
```

For ramp duration calculations, keep units explicit, for example:

```text
duration_s = abs(target - start) / gradient_per_min * 60
```

## Cyclic task collision

When a device is both polled and commanded through the same communication path, check whether cyclic reads can collide with writes.

Recommended controls:
- single communication owner/queue
- minimum command spacing
- request/response state machine
- timeout and retry policy
- suspend or serialize polling around critical writes
- log command timestamp, response timestamp, and origin task

## Logging practice

Before logging:
1. Define the target signals/messages and the trigger or measurement window.
2. Verify the values live in CANoe first.
3. Record enough context to reproduce the run.

For root-cause work, retain raw bus evidence such as BLF/ASC when appropriate. Store the project/database version with the evidence so the log can be decoded later. Avoid committing huge raw logs to normal source control unless the repository is intentionally designed for test data.

## vTESTstudio test design

Convert manual procedures into small deterministic tests:

```text
Precondition → Stimulus → Expected Result → Evidence
```

Guidelines:
- keep one clear purpose per test case
- state preconditions explicitly
- separate stimulus from verdict logic
- use measurable expected results
- capture evidence useful for failure analysis
- avoid timing sleeps when an observable state/event can be awaited instead
- keep reusable setup/cleanup logic centralized

## Project/version hygiene

Prefer relative paths so projects remain portable across PCs. Keep database and project configuration together when practical. Source-control the configuration, database, panel resources, CAPL/source, and automated tests; exclude transient build/runtime files and oversized logs.

For reproducibility, record relevant versions such as:
- project/configuration
- ECU or target software when applicable
- database/DBC
- CANoe/vTESTstudio
- author/date or change reference

## Vector hardware troubleshooting

If one Vector interface or group of channels fails while another works:
- keep the CANoe project identical
- swap only piggies/transceivers first
- swap PCIe/USB location if applicable
- compare hardware revision and driver/firmware support
- test every channel with the same known-good network
- collect Vector hardware configuration/error detail

If the fault follows the interface rather than the piggy/channel/setup, prioritize interface/firmware/driver compatibility over project logic.

## CANoe training: SysVar, Signal, and description files

Teach these as different layers, not interchangeable variables:
- **System Variable (SysVar):** internal CANoe configuration state used by panels, CAPL, or test logic. Changing a SysVar alone does not transmit a CAN message.
- **CAN Signal:** data field in a network message, encoded using the network database and transmitted by an active node.
- **Mapping:** CAPL/simulation logic may map a SysVar to a message signal; verify both the value change and outgoing CAN frame.

Recommended beginner progression: interface/license → SysVar and Signal → description files → simulation/test nodes → Panel → Trace/Graphics → Logging → automated tests.

| Item | Main role |
|---|---|
| DBC | CAN message/signal database |
| ARXML | AUTOSAR system/communication description (scope varies) |
| A2L | ECU measurement/calibration object description |
| XCP | Measurement/calibration communication protocol, not a file format |
| CDD | ECU diagnostic description |

Check actual file content and configured tool support before claiming compatibility.

## Safe lifecycle across multiple test cases

A test case must not reset voltage/current or simulator state while the prior case still has stored energy. Use an explicit lifecycle:

```text
Initialize → Preconditions → Stimulus → Verdict/Evidence
→ Controlled ramp-down → Verify discharge/safe state
→ Reset/prepare → Next test case
```

Keep Panel, SysVar, simulation node, and CAPL/vTESTstudio test module on compatible versions. Use measured thresholds and acknowledgments rather than fixed sleeps; define timeout/abort cleanup. Validate the entire multi-case sequence, not just one isolated test.

## Completion checks

- CAN frames are electrically valid and error counters stable.
- DBC interpretation matches raw bytes.
- The complete signal path is verified from source through output.
- CAPL timing remains correct for the intended run duration.
- Logging contains enough timestamps/context to explain sequence behavior.
- Automated tests have explicit preconditions, stimulus, expected result, and evidence.
- A fix is regression-tested on relevant channels and operating modes.
