# OpenAI curated skills in TOP Private Marketplace

## Scope

This branch packages **39 curated skills** from [openai/skills](https://github.com/openai/skills)
into **7 additional private plugins**, alongside the existing 5 TOP bundles.
The OpenAI repository also contains 5 **system skills**; those are managed by Codex itself and
are not duplicated. Per-skill `LICENSE.txt` and all `scripts/`, `references/`, `assets/`
are copied without edits whenever present.

Source-of-truth mapping: [UPSTREAM_SKILLS.json](UPSTREAM_SKILLS.json).

| Plugin | Purpose | Skill count |
|---|---|---:|
| TOP Design & UX | Figma design, design systems, implementation | 8 |
| TOP Documents & Media | PDF, notebook, speech, transcription, screenshot | 5 |
| TOP Developer Tools | ASP.NET, ChatGPT apps, Playwright, WinUI, CLI | 8 |
| TOP Cloud & Deployment | Cloudflare, Netlify, Render, Vercel | 4 |
| TOP Security & Quality | Threat modeling, code security, Sentry and GitHub review | 6 |
| TOP Productivity & Projects | Notion, Linear, planning | 6 |
| TOP Miscellaneous | Fun and one-off automation | 2 |

## Synchronize official skills

This step needs internet access on your Windows PC or an enabled GitHub Actions runner,
plus Git and Python 3.

```powershell
git clone -b feature/private-skill-plugins https://github.com/TOPTUBBY/ChatGPT-CodexSkills.git
cd ChatGPT-CodexSkills
powershell -ExecutionPolicy Bypass -File .\scripts\sync-upstream-skills.ps1
```

Or on Linux/macOS:

```bash
bash ./scripts/sync-upstream-skills.sh
```

Offline source checkout supported:

```bash
python3 scripts/sync-upstream-skills.py --offline-src /path/to/openai-skills
```

This creates 7 complete plugin folders and appends them to the existing private marketplace.
It is idempotent; running it again updates the 7 generated upstream bundles only.
Personal TOP skills are never overwritten.

Then review and publish to your **private** branch:

```powershell
git status
git add plugins .agents/plugins/marketplace.json
git commit -m "Sync official curated OpenAI skills into private bundles"
git push origin feature/private-skill-plugins
```

Finally register/upgrade your private marketplace:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\register-private-marketplace.ps1
```

Choose individual bundles in the supported ChatGPT Desktop/Codex plugin marketplace interface.
**Do not install TOP All Skills as well as all four TOP personal bundles** unless duplicates
are intentional. The 7 official-skill bundles are separate and do not overlap the personal ones.

## Automated sync on GitHub

The workflow `.github/workflows/sync-openai-curated-skills.yml` can synchronize and commit the
generated packages without requiring Python/Git on your work PC. For a private GitHub repository,
Actions must be enabled and workflow permissions must allow **Read and write** for repository
contents. Run it from **Actions > Sync OpenAI curated skills > Run workflow**, selecting
`feature/private-skill-plugins`. Review the resulting commit before installing.
The workflow also runs when first added to the feature branch; if Actions are disabled,
use the manual script above.

## Licensing and updates

Official skills are **not authored by TOPTUBBY**. Their individual licenses and resource files
remain with the bundled folders. Always review the license and external dependencies before
using a particular skill. Do not copy `skills/.system`; Codex installs those separately.
A synced snapshot is not a real-time upstream update until the sync script/workflow is rerun.
