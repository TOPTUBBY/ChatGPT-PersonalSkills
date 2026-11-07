# TOP Private Skill Plugins

This branch packages the repository's reusable skills into private, category-based plugins for ChatGPT/Codex.

## Plugin bundles

| Plugin | Included skills |
|---|---|
| `top-engineering-core` | automotive-can-capl, engineering-troubleshooting, electrical-power-lab, equipment-driver-integration, switching-power-supply-pcb, technical-comparison-selection |
| `top-embedded-iot` | esp32-data-logger-control, raspberry-pi-linux-troubleshooting, home-assistant-truenas-iot |
| `top-software-automation` | software-release-maintenance, windows-automation-scripting, test-data-plotting-performance |
| `top-technical-communication` | engineering-translation-writing, technical-reporting-presentation, professional-project-readme |
| `top-all-skills` | all 15 skills |

Install either `top-all-skills` or the category bundles you need. Installing both can expose duplicate skill names.

## Recommended private installation

### Windows
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\register-private-marketplace.ps1
```

### macOS / Linux
```bash
bash ./scripts/register-private-marketplace.sh
```

The scripts register this private Git marketplace with Codex. Restart the ChatGPT desktop app, open **Plugins**, choose **TOP Private Skills**, and install the bundle(s) you want.

## ChatGPT web

Local/repo marketplaces are primarily private authoring and distribution sources for supported local clients, and availability can differ by surface. For ChatGPT web, use **Plugins > Personal** / **Plugin Creator** when available to create or import the same skills-only package and keep it personal. Do not submit it to the public directory unless you explicitly want it public.

## Updating

Windows:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\update-private-marketplace.ps1
```

macOS/Linux:
```bash
bash ./scripts/update-private-marketplace.sh
```

## Structure
```text
.agents/plugins/marketplace.json
plugins/
  top-engineering-core/
  top-embedded-iot/
  top-software-automation/
  top-technical-communication/
  top-all-skills/
scripts/
  register-private-marketplace.ps1
  update-private-marketplace.ps1
  register-private-marketplace.sh
  update-private-marketplace.sh
```

Each plugin contains `plugin.json`, a Codex compatibility manifest, and its grouped `skills/`. No MCP server, credentials, customer data, or secrets are bundled.
