# BLE RGB status indicators for test automation

This is a generic integration method for app-controlled BLE RGB indicators, not a universal command protocol. Obtain device-specific GATT characteristics and payload semantics from authorized documentation or captured traffic from a device you own.

## Discovery and control
1. Identify advertised BLE device and distinguish display name from stable device identity.
2. Enumerate GATT services/characteristics; record write vs write-without-response support.
3. Verify packet format, color ordering, brightness encoding, checksum (if any), and acknowledgment/notification behavior with controlled test vectors.
4. Send red, green, blue, white and intermediate colors; measure observed output rather than assuming `#RRGGBB` maps directly to emitted light.
5. Test 0, 1, 50, 98, 99, and 100% brightness. Look for firmware edge cases, integer overflow, special mode values, and gamma mapping.
6. Add reconnect/backoff, command queueing, and last-known-state display. A successful BLE write is not proof of physical color output.

## Status priority model
Keep transport and status policy separate. Example priority: critical safety alert > test failure > resource warning > active test > idle. If multiple alarms exist, explicitly choose highest priority rather than last writer wins. Configure solid/blink patterns and document color accessibility (do not rely on color alone).

## Desktop integration
- BLE I/O must not block GUI callbacks.
- Connection state, requested color, last acknowledged command, and observed output are distinct states.
- For automation clients, obtain test-system status from an existing process through safe attach/read-only APIs; do not accidentally launch another process.
- Use a debug/simulation mode to trigger each alert without needing a real failure.
- Avoid transmitting sensitive equipment names or test data in BLE advertisements.

## Validation
Test device power cycle, out-of-range recovery, repeated commands, 99→100% brightness boundary, app-vs-PC ownership, Bluetooth adapter disconnect, and simultaneous status changes.
