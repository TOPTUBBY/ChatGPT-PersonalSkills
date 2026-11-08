# Packaging Python automation for managed Windows PCs

1. Inventory runtime: Python version/architecture, pywin32, BLE libraries, GUI toolkit, external COM servers, data/config files, drivers.
2. Pin dependencies and create a clean virtual environment on the build host. Remove stale absolute interpreter paths.
3. Build a standalone EXE with an approved packager. Include hidden imports and runtime hooks only when demonstrated necessary; COM support can need special handling.
4. Test on a clean Windows environment without Python installed and with the same IT restrictions as the destination.
5. Confirm GUI remains responsive if BLE, serial, or COM servers are unavailable. Provide a diagnostic export with timestamps and HRESULTs, but redact paths/usernames before public sharing.
6. Do not assume an EXE bypasses application allowlisting, administrator restrictions, or licensing. Coordinate deployment and code-signing with IT where needed.
7. Regression-test disconnect/reconnect, restart, sleep/resume, multiple app instances, update/rollback and clean uninstall.
