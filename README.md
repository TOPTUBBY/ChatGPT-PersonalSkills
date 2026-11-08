<div align="center">

# 🧩 Personal Skills Marketplace

**Private reusable skills for ChatGPT, Codex, Claude, Cowork, Gemini, Gems and compatible AI agents**

**55 unique skills · 11 category plugins · zero duplicate skill sources**

[![Private](https://img.shields.io/badge/Repository-Private-111827?style=for-the-badge)](https://github.com/TOPTUBBY/ChatGPT-PersonalSkills)
[![Skills](https://img.shields.io/badge/Unique%20Skills-55-2563EB?style=for-the-badge)](#catalog)
[![Plugins](https://img.shields.io/badge/Category%20Plugins-11-0EA5E9?style=for-the-badge)](#catalog)
[![Codex](https://img.shields.io/badge/Codex-Skills-6B7280?style=for-the-badge)](https://developers.openai.com/codex/skills/)

[English](#english) · [ภาษาไทย](#ภาษาไทย) · [Multi-AI Guide](MULTI_AI_GUIDE.md) · [Install](#installation) · [Catalog](#catalog) · [Updates](#updates)

</div>

---

<a id="english"></a>

## English

This private repository contains **55 distinct reusable Skills** organized into **11 category Plugins**: 15 personal engineering and software skills, 39 OpenAI curated skills, and Cloudflare's complete `security-audit` skill. Each source Skill is stored **once**, at `plugins/personal-<category>/skills/<skill>/`, with its original supporting resources and licenses.

The older branch `main` contained 15 standalone Skills in `skills/`. Their 35 files were compared with the category-plugin copies using Git blob hashes, and **all matched exactly**. The redundant root `skills/` directory and `top-all-skills` aggregate were retired from the current tree; Git history retains every revision. The replacement **Personal All Skills** account plugin is an optional deployment package, not a duplicate tracked source bundle.

<a id="catalog"></a>


## 🌐 Multi-AI compatibility

This repository is now **vendor-neutral at the skill-source layer**. The 55 unique Skills remain in their canonical category folders. Platform-specific installers and exports are generated without committing duplicate skill trees.

| Provider | Integration | How to use |
|---|---|---|
| ChatGPT / Codex | Existing OpenAI Plugins and Agent Skills | `scripts/register-private-marketplace.ps1` or `--target codex` |
| Claude Code | Claude marketplace + standalone Agent Skills | `.claude-plugin/marketplace.json` or `--target claude-code` |
| Claude Web / Cowork | ZIP uploads, skills / category plugins | `--target claude-web` or `--target claude-plugin` |
| Gemini CLI | Agent Skills | `--target gemini-cli` |
| Gemini Gems | Instructions and Knowledge pack (manual upload) | `--target gem` |
| Other compatible agents | Standard Agent Skills folder | `--target agents` |

**Windows examples:**

```powershell
py -3 scripts/ai-skills.py --target claude-code --all --dry-run
py -3 scripts/ai-skills.py --target claude-code --category personal-engineering-core
py -3 scripts/ai-skills.py --target gemini-cli --all
py -3 scripts/ai-skills.py --target claude-plugin --category personal-security-and-quality
py -3 scripts/ai-skills.py --target gem --category personal-design-and-ux
```

**Claude Code marketplace:** after cloning, run `/plugin marketplace add <local-path-to-repo>` and then `/plugin install personal-engineering-core@personal-skills-marketplace` in Claude Code. The marketplace source must be accessible to Claude; a private GitHub URL alone is not sufficient if authentication is unavailable.

**Important:** Claude/Gemini accounts and ChatGPT accounts are independent. Generated packages do not install themselves into web accounts. Gems are instruction/knowledge configurations, not executable Agent Skills. Capabilities and file-upload limits vary by provider. See the detailed [Multi-AI Guide](MULTI_AI_GUIDE.md).

---

## Catalog

| Category Plugin | Skills | Purpose |
|---|---:|---|
| `personal-engineering-core` | 6 | CANoe/CAPL, troubleshooting, equipment, power lab and PCB |
| `personal-embedded-and-iot` | 3 | ESP32, Raspberry Pi, Home Assistant, TrueNAS |
| `personal-software-and-automation` | 3 | Windows automation, plotting, software release |
| `personal-technical-communication` | 3 | Bilingual reports, presentations, README |
| `personal-design-and-ux` | 8 | Figma, UI, design systems |
| `personal-documents-and-media` | 5 | PDF, notebooks, screenshots, speech |
| `personal-developer-tools` | 8 | ASP.NET, WinUI, Playwright, CLI |
| `personal-cloud-and-deployment` | 4 | Cloudflare, Render, Netlify, Vercel |
| `personal-security-and-quality` | 7 | Cloudflare Security Audit, security reviews, CI and monitoring |
| `personal-productivity-and-projects` | 6 | Notion, Linear and planning |
| `personal-miscellaneous` | 2 | Special-purpose workflows |
| **Total** | **55** | **11 non-overlapping category Plugins** |

Five OpenAI System Skills are intentionally **not** mirrored or overwritten.

<a id="installation"></a>

## Installation — Windows

Clone the private repository (you need GitHub access):

```powershell
git clone https://github.com/TOPTUBBY/ChatGPT-PersonalSkills.git
cd ChatGPT-CodexSkills
```

**Codex Standalone Skills (Python 3):**

```powershell
# Install the original 15 custom skills from their single canonical locations
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -Personal

# Preview all 55 skills, with no changes
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -All -DryRun

# Install all 55 distinct skills
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -All

# Install one
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -Skill automotive-can-capl
```

The default destination is `~/.agents/skills`. Existing same-name folders at the selected
destination are replaced (back up local edits first). Restart Codex after installation.
macOS/Linux: `bash scripts/install-standalone-skills.sh --personal`.

**Private Codex Plugin Marketplace (Codex CLI with plugin commands):**

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\register-private-marketplace.ps1
```

Choose the category plugins you need. Do not install the same Skill as a Plugin
and a Standalone Skill in one runtime scope if you want to avoid duplicate names.

**Migrating an existing Codex installation:** see [CODEX_MIGRATION.md](CODEX_MIGRATION.md).
On Windows, run `powershell -ExecutionPolicy Bypass -File .\\scripts\\migrate-codex.ps1 -Mode Plugin` for marketplace updates, or `-Mode Standalone` for a fresh install of the 55 distinct Skill folders. This script cannot remove obsolete old-name Plugins from an unconnected PC automatically.

**ChatGPT Web:** Personal Plugins are stored independently from GitHub. Newly created
`personal-*` ChatGPT Plugins are independent from old account releases; the older TOP-named plugins have been manually cleaned up.
Changes to this repo will also not automatically update existing account Plugins.

<a id="updates"></a>

## Updates and synchronization

```powershell
# Review upstream changes before publishing
powershell -ExecutionPolicy Bypass -File .\scripts\sync-upstream-skills.ps1
py -3 scripts/sync-cloudflare-security-audit.py
git status
git add plugins .agents/plugins/marketplace.json
git commit -m "Sync official skills"
git push origin main
```

The [GitHub Actions workflow](.github/workflows/sync-openai-curated-skills.yml)
syncs curated OpenAI skills and Cloudflare Security Audit, runs Node.js validator
tests, and checks no skill folder name appears in more than one category.
Workflow writes to `main` only when granted the required repository permission.

To update one personal skill, edit its canonical folder in `plugins/personal-<category>/skills/`.
Do not add back root `skills/` or duplicate it into another category.

### Structure

```text
ChatGPT-PersonalSkills/
├── .agents/plugins/marketplace.json
├── .github/workflows/sync-openai-curated-skills.yml
├── plugins/
│   ├── personal-engineering-core/skills/
│   ├── personal-embedded-and-iot/skills/
│   ├── personal-software-and-automation/skills/
│   ├── personal-technical-communication/skills/
│   ├── personal-design-and-ux/skills/
│   ├── personal-documents-and-media/skills/
│   ├── personal-developer-tools/skills/
│   ├── personal-cloud-and-deployment/skills/
│   ├── personal-security-and-quality/skills/
│   ├── personal-productivity-and-projects/skills/
│   └── personal-miscellaneous/skills/
├── PERSONAL_SKILLS.json
├── UPSTREAM_SKILLS.json
├── scripts/
├── README.md
└── LICENSE
```

### Provenance and licensing

This GitHub repository remains **private**. No credentials, private infrastructure,
customer-specific records or proprietary logs belong in the reusable skills.
Original personal skills use the root MIT license. Third-party content keeps
its own original license and credit:

- <https://github.com/openai/skills> — curated OpenAI Skills
- <https://github.com/cloudflare/security-audit-skill> — MIT Cloudflare Security Audit

The complete Cloudflare audit requires Node.js, independent agent verification and an
OS-enforced sandbox; the skills-only ChatGPT Web Plugin does not supply those automatically.

<a id="ภาษาไทย"></a>

## ภาษาไทย

Repository นี้เป็นคลังส่วนตัวรวม **55 Skills** แยกใน **11 Plugins** ตามประเภทการใช้งาน
โดยใช้ชื่อขึ้นต้น `personal-` ทุก Plugin และเก็บ Skill ต้นฉบับเพียงชุดเดียวต่อหมวด
ชื่อ Skills รายตัว เช่น `automotive-can-capl` หรือ `security-audit` ไม่เปลี่ยน
เพื่อรักษาความเข้ากันได้กับโปรเจกต์เดิม

สำหรับ Windows สามารถ Clone Repository แล้วใช้สคริปต์ติดตั้ง Skills แบบรายตัว,
เฉพาะ 15 ตัวส่วนตัว หรือทั้งหมด 55 ตัวได้ ส่วน ChatGPT Web Personal Plugins
ต้องอัปเดตและจัดการแยกต่างหากจาก GitHub

**หลังเปลี่ยนชื่อ:** ยืนยันการติดตั้ง Plugin ใหม่ให้สมบูรณ์ก่อนลบ Plugin ชื่อเดิม
เพื่อไม่ให้ความสามารถที่ใช้งานอยู่หายไป

---

## Repository status

- **Visibility:** Private
- **Default branch:** `main`
- **Unique Skills:** 55 (15 personal + 39 OpenAI + 1 Cloudflare)
- **Category Plugins:** 11
- **Naming:** `personal-*`
- **Updated:** 2026-11-08
- **Platform adapters:** ChatGPT/Codex, Claude Code/Cowork/Web, Gemini CLI/Gems, standard Agent Skills
