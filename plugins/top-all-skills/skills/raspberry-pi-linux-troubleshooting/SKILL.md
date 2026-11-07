---
name: raspberry-pi-linux-troubleshooting
description: Troubleshoot Raspberry Pi and Linux remote-access, desktop-session, Wi-Fi, AP/client mode, autologin, VNC/WayVNC, Wayland/X11, headless resolution, Raspberry Pi Connect, and boot networking issues. Use a quick-to-deep stepwise method driven by command output.
---

# Raspberry Pi / Linux Troubleshooting

Work from fast, high-probability checks toward deeper diagnostics. In interactive troubleshooting, give one actionable step at a time when the user wants to follow along.

## Quick-to-deep order

1. Confirm power/boot and IP address.
2. Confirm SSH reachability.
3. Confirm OS edition and desktop packages.
4. Confirm graphical target/session is running.
5. Confirm desktop autologin if a headless graphical session depends on it.
6. Identify display stack:
   - Wayland + WayVNC
   - X11 + VNC server
7. Check VNC service status and logs.
8. Check headless display/resolution configuration.
9. Inspect user/session permissions and environment.
10. Only then reinstall or switch major components.

## VNC black-screen checks

Distinguish:
- no graphical session
- VNC connected to wrong/empty display
- Wayland/X11 mismatch
- autologin disabled
- headless display has no mode/resolution
- desktop packages missing
- service running under wrong user/session

Ask for command output rather than making several disruptive changes at once.

## Wi-Fi AP → client recovery

When a Pi was configured as an access point and must return to normal Wi-Fi client mode:
- identify which network stack owns the interface
- disable AP-specific services/config only after confirming ownership
- configure the target SSID securely
- verify DHCP/default route/DNS
- reboot once configuration is internally consistent
- confirm auto-connect after boot

Avoid simultaneously configuring the same interface through multiple managers.

## Raspberry Pi Connect

Check:
- package/service installed
- account sign-in/link status
- network connectivity
- session requirements
- service logs

## Response style

Prefer:
1. one command/check
2. expected result
3. what each possible output means
4. next command based on the result

Do not dump a long recovery procedure unless explicitly requested.
