---
name: automotive-can-capl
description: Develop, debug, and review automotive CAN/CANoe/CAPL/DBC workflows, including Classical CAN setup, signal/database validation, timing, long-duration measurements, Vector interface troubleshooting, logging, and equipment control through CANoe. Use for CAN communication, CAPL test sequences, DBC integration, and Vector hardware issues.
---

# Automotive CAN / CANoe / CAPL

Build and troubleshoot CAN-based test systems with a strong separation between network, database, sequence, hardware interface, and equipment layers.

## Workflow

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
3. In CANoe, separate:
   - network configuration
   - CAPL logic
   - test sequence
   - logging
   - equipment interface
4. Reproduce failures with the smallest configuration possible.
5. Compare against a known-good channel/interface when hardware is suspect.

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

## Vector hardware troubleshooting

If one Vector interface or group of channels fails while another works:
- keep the CANoe project identical
- swap only piggies/transceivers first
- swap PCIe/USB location if applicable
- compare hardware revision and driver/firmware support
- test every channel with the same known-good network
- collect Vector hardware configuration/error detail

If the fault follows the interface rather than the piggy/channel/setup, prioritize interface/firmware/driver compatibility over project logic.

## Completion checks

- CAN frames are electrically valid and error counters stable.
- DBC interpretation matches raw bytes.
- CAPL timing remains correct for the intended run duration.
- Logging contains enough timestamps to explain sequence behavior.
- A fix is regression-tested on relevant channels and operating modes.
