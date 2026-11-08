---
name: home-assistant-truenas-iot
description: Plan and troubleshoot Home Assistant OS running as a TrueNAS virtual machine, including networking, remote access, device integrations, mixed ecosystems such as LG ThinQ and Smart Life, and future smart-home expansion. Use for guided installations where the user prefers one verified step at a time.
---

# Home Assistant on TrueNAS

Build the platform incrementally. When the user is performing the setup live, provide one step, expected result, and next branch instead of a giant installation dump.

## Deployment sequence

1. Confirm TrueNAS edition/version and virtualization support.
2. Confirm CPU/RAM/storage/network resources available to the VM.
3. Create Home Assistant OS VM using the correct image/disk format.
4. Boot and confirm console/network assignment.
5. Open Home Assistant locally and complete onboarding.
6. Verify stable LAN addressing before adding integrations.
7. Add integrations one ecosystem at a time.
8. Confirm backup/recovery before major customization.

## Networking

Prefer a VM network mode that gives Home Assistant normal LAN reachability to local IoT devices. mDNS/SSDP/discovery may fail when the VM is isolated behind inappropriate NAT or VLAN rules.

If remote access already uses a VPN/overlay such as Tailscale, keep remote management separate from cloud exposure and do not unnecessarily expose Home Assistant directly to the public Internet.

## Integration workflow

For each ecosystem:
1. confirm device is visible and controllable in its native app
2. install/configure the corresponding Home Assistant integration
3. authenticate through the supported method
4. verify entities
5. rename/group only after functionality is stable

## Mixed IoT environment

Common categories include:
- televisions/appliances
- cloud-connected smart plugs
- locks
- voice assistants
- sensors

Document which devices depend on cloud services vs local control so outage behavior is understood.

## Troubleshooting

Check in this order:
- VM running
- IP connectivity
- DNS/time
- Home Assistant health
- integration logs
- vendor cloud account status
- local discovery/VLAN firewall

## Change discipline

After each major integration or network change, take a backup/snapshot appropriate to the platform. Avoid changing VM networking, DNS, and several integrations simultaneously because failures become difficult to isolate.
