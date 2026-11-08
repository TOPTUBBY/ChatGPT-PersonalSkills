# Personal Skills Marketplace

Canonical source: `main`. All plugin names use the `personal-*` convention.

**11 category Plugins, 55 unique Skills** (15 custom, 39 OpenAI curated, 1 Cloudflare).
The repository stores each original Skill once under `plugins/personal-<category>/skills/<skill>/`.

The old root `skills/` directory and `top-all-skills` aggregate were retired after
checking that all original 35 tracked files were byte-identical to corresponding
category copies. Their earlier revisions remain in Git history.

`personal-all-skills` exists as a **separate ChatGPT Personal Plugin** for convenience,
packaged from the canonical 15 personal Skills. It is not also duplicated in this
repository's category marketplace.

Standalone Codex skills can be installed from the canonical categories:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -Personal
powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 -All -DryRun
```

To register the private Codex marketplace:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\register-private-marketplace.ps1
```

ChatGPT Web Personal Plugins are separate account resources and do not synchronize
automatically when GitHub is updated. The older `top-*` account plugins may still
be installed until specifically uninstalled. The CLI and repository scripts cannot
change the state of a remote Codex installation on a Windows PC that is not connected.

For full instructions see [README.md](README.md).
