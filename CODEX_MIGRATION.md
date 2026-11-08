# Migrating Codex after the Personal rename

Repository: `TOPTUBBY/ChatGPT-PersonalSkills` (`main`).

The 11 source category Plugin packages now use the `personal-*` namespace.
The underlying 55 unique Skill names were intentionally not changed because
they already use domain-based names and existing project references depend on them.

## Windows

```powershell
git clone https://github.com/TOPTUBBY/ChatGPT-PersonalSkills.git
cd ChatGPT-PersonalSkills

# Update private plugin marketplace in a Codex CLI that supports plugin commands
powershell -ExecutionPolicy Bypass -File .\scripts\migrate-codex.ps1 -Mode Plugin

# Or update all local standalone skill folders (don't also enable overlapping Plugins)
powershell -ExecutionPolicy Bypass -File .\scripts\migrate-codex.ps1 -Mode Standalone -Preview
powershell -ExecutionPolicy Bypass -File .\scripts\migrate-codex.ps1 -Mode Standalone
```

The script uses `git pull --ff-only` and refuses to overwrite a divergent branch.
It **does not** remove old Codex plugin installations automatically; inspect
Codex's Plugins interface for obsolete `top-*` entries, enable the corresponding
`personal-*` entries, test, and then uninstall obsolete ones manually.

If a Codex CLI version lacks Plugin marketplace commands, use the Standalone
mode with Python 3 or update Codex where permitted.

## ChatGPT Web

The 12 renamed Personal Plugins are already saved to the ChatGPT account.
Their old `top-*` creator-owned entries may remain visible in **Created by you**.
Uninstall is not equivalent to deleting a creator-owned Plugin. Use any available
management controls to archive/delete obsolete creator entries after verifying
the replacement. ChatGPT account plugins are not synchronized from GitHub.

This is a migration guide and script — it cannot remotely run on a Windows PC
that has not provided an execution environment.
