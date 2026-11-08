---
name: esp32-data-logger-control
description: Design and troubleshoot ESP32/ESP32-C3 web-based equipment loggers and controllers using serial links, SD logging, sampling, profiles, live graphs, run status, and multi-node networking. Use for climatic chamber/chiller/instrument control, PC-less logging, blocking serial problems, and embedded web UI architecture.
---

# ESP32 Data Logger & Control

Build embedded loggers so communication failures do not freeze the web UI or corrupt the logging/control state.

## Architecture

Separate the system into layers:
1. Equipment protocol driver
2. Polling/control scheduler
3. Shared data model
4. Logger/SD writer
5. Web API/server
6. Browser UI
7. Profile/program runner
8. Network discovery/multi-node layer

## Serial communication

For RS232 equipment through a level shifter such as MAX3232:
- confirm voltage levels and pin direction
- configure baud/data/parity/stop bits exactly
- send required line terminators
- parse only complete frames
- validate field count and status bits
- use bounded timeout/retry behavior

Avoid blocking loops such as waiting indefinitely for serial bytes. Prefer:
- non-blocking state machine
- short bounded reads
- queue/task separation
- timestamps for last valid response
- offline state after timeout

The web server must continue responding while equipment is offline.

## Data model

Use one explicit struct/object for the latest sample, for example:
- set temperature
- actual temperature
- set humidity
- actual humidity
- machine value/output
- run status
- communication status
- sample timestamp

Define the type before helper functions that consume it and avoid duplicate incompatible sample structures.

## SD logging

- Keep CSV headers stable and versioned.
- Write at a user-selected sampling period.
- Preserve the original sample timestamp.
- Buffer writes when appropriate, but flush often enough for fault tolerance.
- Detect card/mount/write errors separately from equipment-offline errors.

## Web graph

Useful traces:
- setpoint vs actual
- humidity setpoint vs actual
- run status

For long sessions, implement a visible time window or downsample old browser data. Keep sampling settings linked to the logger configuration rather than duplicating independent controls.

## Profile runner

Represent program steps explicitly with fields such as:
- step index
- type (`normal`, `loop_start`, `loop_end`)
- duration
- temperature
- humidity
- loop count

Validate loop pairing and stop safely on malformed profiles, communication loss, or explicit user stop.

## Multi-node networking

For large labs, evaluate:
- infrastructure Wi-Fi + wired APs
- ESP-NOW peer/star designs
- mesh-style routing

Prioritize graceful node disappearance. One node going offline should not make unrelated nodes uncontrollable. Track node heartbeat, last-seen time, and capability metadata.

## Serial relay-controller extension

For ESP32/ESP8266 relay control through a PC GUI, distinguish **command sent**, **device acknowledged**, and **physical output verified**. A COM port opening successfully does not prove a relay switched.

- Define framing and validation, e.g. `STX | CMD | DATA | CHECKSUM | ETX`; document exact bytes, length, checksum, and response behavior.
- Reject malformed frames, unsupported commands, and invalid channel numbers before touching GPIO.
- Default to a safe startup output state (usually all OFF), taking active-low relay boards into account.
- Verify GPIO boot/strapping constraints, 3.3 V logic compatibility, relay power supply, contact ratings, and isolation. ESP32-C3 and ESP8266 GPIO maps are not interchangeable.
- Support ALL OFF and individual channel control; resynchronize GUI after reset, disconnect, and reconnect.
- When testing virtual COM/RFC2217 bridges, verify supported timeout and serial options rather than assuming physical COM behavior.
- Never treat an MCU relay as the sole safety interlock for hazardous power.

## Completion checks

- UI remains responsive with equipment disconnected.
- Logging continues or fails explicitly without blocking control.
- Start/stop state matches equipment response, not only the last command sent.
- Profiles survive invalid data and communication timeouts safely.
- Multi-node dashboard clearly distinguishes online/offline nodes.
