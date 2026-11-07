---
name: technical-comparison-selection
description: Compare engineering components, sensors, instruments, storage media, communication methods, or architectures using measurable requirements, compatibility, accuracy, bandwidth, safety, cost, reliability, and practical constraints. Use when the user asks which technical option is best for a specific application.
---

# Technical Comparison & Selection

Do not select equipment from one headline specification. Start from the application and convert it into engineering requirements.

## Selection workflow

1. Define what must be measured/controlled/transferred.
2. Quantify range, accuracy, resolution, bandwidth, sampling, environment, isolation, latency, storage, or load as applicable.
3. Identify hard compatibility constraints.
4. Separate “must-have” from “nice-to-have”.
5. Compare candidate technologies in a table.
6. Recommend the simplest option that satisfies the hard requirements with margin.
7. State where additional datasheet verification or real testing is needed.

## Example criteria

### Current measurement
Compare:
- AC/DC capability
- principle: CT, Hall, fluxgate, shunt, closed-loop transducer
- accuracy
- bandwidth
- isolation
- burden/power loss
- output interface
- current range

Do not classify CT vs transducer only from the ratio printed on the device.

### SD/storage for embedded logging
Compare:
- SDHC vs SDXC capacity
- FAT32 vs exFAT compatibility
- endurance
- sustained write speed
- write latency
- controller/library support

For embedded loggers, compatibility and endurance can matter more than peak speed class.

### Network architecture
Compare:
- coverage
- single-point failure
- node count
- latency
- infrastructure cost
- recovery when a node disappears
- maintenance complexity

## Recommendation format

Use:
- **Best choice:** option
- **Why:** 2–4 application-specific reasons
- **When not to use it:** boundary/limitation
- **Alternative:** next-best option and tradeoff

Avoid fake precision when the datasheet/application requirements are incomplete.
