# Install Cloudflare security-audit as a standalone skill

Source: https://github.com/cloudflare/security-audit-skill

The standalone skill is **independent** from the existing TOP Security & Quality Personal Plugin.
The private GitHub branch already carries the complete upstream skill in
`plugins/top-security-quality/skills/security-audit/`, including its MIT license.

## Windows (recommended)

Prerequisite: Node.js LTS with npm/npx, internet access, and your Codex client.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-cloudflare-security-audit.ps1
```

Or directly:

```powershell
npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit --global
```

The Skills CLI may ask you to choose the target coding agents. Select Codex and
approve the installation. Restart Codex and verify the installed `security-audit` skill.
To install at project level instead of globally, run the script with `-Global:$false`.

## macOS / Linux

```bash
bash ./scripts/install-cloudflare-security-audit.sh
```

Pass `--local` for project-level installation.

## Use

Inside Codex, open your own repository and ask:

```text
Use security-audit to audit this repository. Produce a coverage ledger and
report confirmed, needs_validation, and rejected findings with evidence.
```

A full audit needs Node.js, independent subagents and OS-enforced sandboxing
for potentially untrusted builds/tests. The skill does not grant these automatically.
Keep network-restricted, isolated execution for untrusted project code.

## ChatGPT Web vs Codex

The TOP Security & Quality Personal Plugin already includes a guidance version
of the skill on chatgpt.com. A standalone Codex skill is installed on the actual
Codex environment/device, not silently pushed into a logged-in ChatGPT Web account.

This script is staged in GitHub for users to run; committing it does not install
anything on your PC.
