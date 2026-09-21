---
name: software-release-maintenance
description: Maintain an existing software repository by inspecting issues and source, preserving the approved baseline, fixing bugs, regression-testing, updating README/version history, packaging releases, and preparing update mechanisms. Use when the user asks to modify a real repository and deliver a complete versioned package.
---

# Software Release Maintenance

Treat a working baseline as an asset. Do not casually rewrite or rename major components when the task is a targeted fix.

## Required workflow

1. Inspect repository status, current branch, version files, README, dependencies, entry points, launchers, tests, and open issues relevant to the request.
2. Identify the approved baseline/version and preserve it unless the user explicitly approves a new baseline.
3. Reproduce or trace the reported issue before editing.
4. Make the smallest coherent fix that addresses the root cause.
5. Add or run regression checks covering the changed behavior and nearby functionality.
6. Update documentation and version history when behavior, installation, configuration, or release identity changes.
7. Package the same files that were tested.
8. Review the final diff for unrelated edits, generated junk, secrets, and accidental baseline changes.

## GUI/performance fixes

For desktop tools, verify:
- layout at realistic signal/data counts
- persistence across restart
- exception handling on external application disconnect
- long-run CPU/memory behavior
- default settings
- backward compatibility with presets/config

## Release package

When requested, a full release may include:
- executable/runtime files
- required DLLs/libraries
- launchers
- config/templates
- README/manual
- VERSION_HISTORY/CHANGELOG
- source archive when appropriate

Keep “source package” and “runtime/full package” clearly distinguished.

## Version discipline

- Never silently advance a baseline.
- If a proposed version is cancelled/reverted, documentation must return to the approved version.
- Make release status explicit: development, release candidate, or released.
- Version shown in UI, docs, filenames, and history should agree.

## Auto-update design

A lightweight launcher/updater should:
- compare local vs published version
- tell the user when already current
- download a complete compatible update set
- replace files safely outside the running process
- preserve user configuration where required
- support rollback or at least leave recoverable previous files

## Completion report

Summarize:
- files changed
- root cause
- fix
- tests run
- known limitations
- resulting version/package
