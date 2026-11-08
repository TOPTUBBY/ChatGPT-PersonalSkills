# Cloudflare security-audit integration

Source: https://github.com/cloudflare/security-audit-skill

## Classification

- Type: standalone coding-agent skill; not a Cloudflare ChatGPT plugin
- Category: TOP Security & Quality
- Original license: MIT (retain full license with the copied skill)
- Skill name: `security-audit`
- Plugin: `personal-security-and-quality` (seven skills after integration)
- Git branch: `main`

The integration is a complete source snapshot, not an adapted summary: all skill files, JSON schema, Node validators, test fixtures and license are retained. The Cloudflare repo is an upstream dependency, not a dependency of OpenAI's curated repository.

## Updating from upstream

```powershell
py -3 scripts/sync-cloudflare-security-audit.py
```

The GitHub Actions workflow also runs the Cloudflare synchronization *after* the OpenAI curated sync on each selected workflow run, preventing the Cloudflare folder from being removed when `personal-security-and-quality` is regenerated.

## Limitations

Using the skill as instructions is different from running its full audit harness. Full audit requires a capable coding agent with independent sub-agents, a Node.js runtime, and OS sandboxing of target-controlled code. Browser-only chat cannot guarantee those prerequisites.

Do not delete the originally installed standalone security audit skill until the plugin has been verified with the full source content and required execution tools.
