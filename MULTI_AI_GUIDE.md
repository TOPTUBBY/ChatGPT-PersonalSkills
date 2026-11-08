# Multi-AI Installation Guide

The canonical source for all **55 unique skills** is `plugins/personal-*/skills/<skill>/`. No second source copy is maintained. The same skills can be adapted to multiple agent products, but **capability parity is not guaranteed**: each host offers different tools, networking, execution permissions and plugin interfaces.

## Platform support

| Platform | Output / install route | Verified mechanism |
|---|---|---|
| ChatGPT Web | Existing private Personal Plugins | Saved via ChatGPT Plugin Creator, independent from GitHub |
| Codex | Existing marketplace or `--target codex` | `~/.agents/skills/` |
| Claude Code | `.claude-plugin/marketplace.json` or `--target claude-code` | `~/.claude/skills/` |
| Claude Web / Claude Cowork | `--target claude-web` (skill ZIP), `--target claude-plugin` (category ZIP) | Upload via Customize > Skills or Plugins |
| Gemini CLI | `--target gemini-cli` | `~/.gemini/skills/` |
| Gemini Gems | `--target gem` | Instructions + Knowledge files, manually upload |
| Cursor | `--target cursor` | `~/.cursor/skills/` where supported |
| Generic agents | `--target agents` | `~/.agents/skills/` where Agent Skills are supported |

`Python 3` is needed for this repository's installer/exporter. For filesystem installations, use `--scope user` (default) or `--scope project`. Use `--dry-run` first; `--force` replaces existing matching skill directories. Make backups of local edits.

### Windows examples

```powershell
git clone https://github.com/TOPTUBBY/ChatGPT-PersonalSkills.git
cd ChatGPT-PersonalSkills

# Preview (safe, no writes)
py -3 scripts/ai-skills.py --target claude-code --all --dry-run

# Claude Code user skills
py -3 scripts/ai-skills.py --target claude-code --all

# Gemini CLI user skills
py -3 scripts/ai-skills.py --target gemini-cli --all

# Install a single skill for Claude Code
py -3 scripts/ai-skills.py --target claude-code --skill automotive-can-capl

# Claude web custom Skill ZIPs
py -3 scripts/ai-skills.py --target claude-web --category personal-engineering-core

# Claude Cowork / Chat category Plugin ZIP
py -3 scripts/ai-skills.py --target claude-plugin --category personal-engineering-core

# Gemini Gem documents
py -3 scripts/ai-skills.py --target gem --category personal-engineering-core
```

Alternatively: `powershell -ExecutionPolicy Bypass -File scripts/ai-skills.ps1 -Target claude-code -All`.

### macOS/Linux examples

```bash
python3 scripts/ai-skills.py --target claude-code --all
python3 scripts/ai-skills.py --target gemini-cli --category personal-security-and-quality
bash scripts/ai-skills.sh --target claude-web --skill security-audit
```

### Claude Code plugin marketplace

The new Claude marketplace is at `.claude-plugin/marketplace.json`. Each category has `plugins/<name>/.claude-plugin/plugin.json` with a `skills/` folder. From a local authenticated clone:

```text
/plugin marketplace add ./path/to/ChatGPT-PersonalSkills
/plugin install personal-engineering-core@personal-skills-marketplace
```

Or use the `claude plugin marketplace add` and `claude plugin install` commands in the CLI. The plugin marketplace may be added from the private GitHub repository only if the Claude environment has access; otherwise add the local clone. For Claude chat/Cowork, use ZIP upload through Customize > Plugins (availability depends on subscription). Skills can also be individually uploaded under Customize > Skills.

**Do not simultaneously install a category plugin and standalone copies of the same skills into the same Claude scope.**

### Gemini CLI

Gemini CLI detects Agent Skills in `~/.gemini/skills/` (user) and `.gemini/skills/` (workspace), and also recognizes `~/.agents/skills/` aliases. Confirm using `/skills list` or `gemini skills list`.

### Gemini Gems

Gems use **instructions and uploaded knowledge**, not agent-executable `SKILL.md` discovery. The `gem` export creates `dist/gem/<category>/GEM_INSTRUCTIONS.md` and `knowledge/*.md`. Create a new Gem at Gemini > Gems, paste `GEM_INSTRUCTIONS.md`, and upload **the subset of knowledge files that fits your account's file limits**. Resource scripts are not executed automatically.

### Other products

The `agents` output uses the Agent Skills standard directory structure. Import it only into agents that explicitly support that structure. Do not equate importing instructions with availability of local tools, hardware drivers, MCP connectors, or execution rights.

## Safety and licensing

Private repository access does not automatically grant third-party agents access. Avoid uploading proprietary or sensitive materials to external provider accounts. The Cloudflare `security-audit` skill contains executable validators; execute only in a suitably isolated environment, and keep upstream MIT/license notices intact.

## Testing

Run `python3 scripts/ai-skills.py --target claude-code --all --dry-run` to validate the unique skill list. GitHub Actions also exercises safe exports and tests archive contents. Actual user-account installation for Claude/Gemini cannot be performed from a GitHub commit alone.

References: [Claude plugins](https://code.claude.com/docs/en/plugins-reference), [Claude marketplace](https://code.claude.com/docs/en/plugin-marketplaces), [Gemini CLI skills](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/skills.md), [Gemini Gems](https://support.google.com/gemini/answer/15235603).
