# CANoe COM automation diagnostics (Windows)

Use this reference when a Python/C# desktop tool cannot attach to an already running CANoe instance, reconnects unexpectedly, or launches a second configuration.

## Connection state machine
`Disconnected → Discover running process → Attach to active COM object → Validate configuration/measurement → Connected → Lost → Backoff → Retry`.

Separate **attach** from **launch**. Monitoring tools must not create a new CANoe process merely because attachment failed. Explicit launch requires a user-approved setting. Use bounded retries and an observable state indicator.

## Evidence checklist
- Confirm process is running and identify 32/64-bit process, actual executable path, and CANoe version.
- Record application bitness, Python version, pywin32 version, current Windows user and elevation level.
- Check whether CANoe and client run in the same interactive session and compatible privilege levels.
- Distinguish `GetActiveObject` (attach) from `Dispatch` / activation (may launch). Test attachment without automatic launch.
- Capture HRESULT in hexadecimal, stack trace, connection phase, timestamps and retry interval.
- On disconnect, release stale COM references; reconnect without blocking the UI thread.

## Error patterns
- `0x800401E3` (operation unavailable): active object not found or not accessible; investigate registration/session/elevation before assuming CANoe is closed.
- `0x800706BA` (RPC server unavailable): server process terminated or COM connection invalid; invalidate references and retry with backoff.
- `pythoncom.CLSIDFromProgID` missing: check imported `pythoncom` module and pywin32 installation/package conflicts; do not assume a particular method is exported in every environment. Prefer supported API usage and validate in a minimal script.
- Python executable path no longer exists: remove stale venv/launcher shebangs; rebuild from an installed interpreter and pin dependencies.

## Threading and responsiveness
COM objects generally have apartment/thread affinity. Initialize COM on each worker thread that uses it, keep object access on its owning thread, and marshal state/results to the UI. Avoid blocking UI callbacks with COM polling, sleep loops, or synchronous retries. Use explicit cancellation during shutdown.

## Standalone packaging
For IT-managed PCs, package a signed/approved standalone executable where permitted. Build with the intended architecture, include pywin32 COM support/runtime dependencies, test on a clean target machine without developer Python, and retain a diagnostic-report export. Packaging does **not** bypass IT policies or COM registration.

## Regression matrix
Test: CANoe absent; CANoe open/measurement stopped; measurement running; CANoe closed mid-run; CANoe restarted; client restart; mismatched elevation; unavailable COM registration. Confirm **no unintended CANoe launch**, bounded reconnect, and responsive controls.
