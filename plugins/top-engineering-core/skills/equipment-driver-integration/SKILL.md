---
name: equipment-driver-integration
description: Design reusable test-equipment interface drivers for SCPI, GPIB, RS232, Modbus RTU/TCP, and similar command/response protocols, especially when integrating instruments into CANoe/CAPL or automated test sequences. Use for protocol mapping, command wrappers, parsing, retries, cyclic polling, and driver refactoring.
---

# Equipment Driver Integration

Separate transport, protocol, device state, and test-sequence logic so a new instrument does not duplicate the whole communication stack.

## Layered design

1. **Transport** — GPIB, serial, TCP, CAN, etc.
2. **Protocol framing** — terminators, addresses, checksums, Modbus framing.
3. **Device commands** — SCPI strings/register maps.
4. **Parser/state** — responses converted to typed values/status.
5. **Scheduler** — cyclic polling, retries, timeout, command queue.
6. **Test API** — clear functions such as set voltage, set frequency, output on/off, get status.

## Before coding

Extract from the manual:
- command syntax
- query syntax
- required terminator
- units and valid ranges
- response examples
- error/status registers
- timing restrictions
- remote/local mode behavior
- connection settings

Build a command table rather than scattering raw strings through the code.

## Reuse existing generic modules

When a project already has common communication helpers, prefer adapting them over creating a new transport stack. Typical reusable areas:
- RS232 send/read
- GPIB communication
- Modbus RTU/TCP
- logging
- cyclic update scheduler
- error handling

Keep equipment-specific commands in the equipment driver layer.

## Poll/write collision control

Cyclic reads must not interfere with critical set commands. Use a queue or single communication owner and record timestamps. If the instrument cannot process concurrent requests, serialize all access.

## Robustness

- explicit timeout
- bounded retry
- response validation
- range checking before send
- instrument error query after critical commands
- connection/reconnect state
- safe state after communication loss
- structured logging of TX/RX and errors

## Validation

Test the driver in stages:
1. identify/query
2. one read
3. one harmless set/query-back
4. output control at safe conditions
5. cyclic polling
6. integration with full sequence
7. recovery from cable/device disconnect

Do not claim driver support for a command until it is mapped and verified against protocol documentation or the real equipment.
