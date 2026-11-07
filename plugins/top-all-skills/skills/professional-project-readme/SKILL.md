---
name: professional-project-readme
description: Create or overhaul repository README.md files in the user's preferred professional DataPEA/ADTD-inspired format, with centered branding, badges, bilingual English/Thai orientation, feature tables, workflow, setup, structure, security, troubleshooting, and version information. Use for new project documentation or substantial README redesigns; do not use for ordinary prose documents or tiny README typo fixes.
---

# Professional Project README

Create a polished repository landing page that feels consistent across the user's projects while remaining accurate to the current repository.

## Required workflow

1. Inspect the repository before drafting. Read the existing README, version/changelog files, dependency manifests, launchers, main entry points, configuration, tests, and available brand assets. Check the worktree so unrelated user changes are preserved.
2. If the user supplies a reference repository or document, inspect it before writing. Use it for visual hierarchy and information architecture, not for copying project-specific claims.
3. Establish verified facts: project purpose, audience, language/runtime, framework, supported platforms, install/start/test commands, ports, inputs and outputs, roles, storage, security boundaries, deployment modes, version, maintainer, and license status.
4. Adapt [assets/README.template.md](assets/README.template.md). Remove sections that do not apply and add project-specific sections only when they improve onboarding or safe operation.
5. Preserve an existing documentation language choice unless the user requests otherwise. By default for this user, provide English and Thai orientation plus bilingual labels or summaries where practical; technical commands remain language-neutral.
6. Verify every local link and referenced file. Run the documented validation command when safe and relevant. Check the final diff for whitespace and accidental runtime or secret data.
7. When the repository already maintains `VERSION_CONTROL.md`, `VERSION_HISTORY.md`, `CHANGELOG.md`, or an in-app version label, keep them synchronized with a user-requested release. Do not invent a new release or publish changes unless the task authorizes it.

## Preferred presentation pattern

- Begin with a centered project identity: optional real repository logo, project name, concise English tagline, and concise Thai tagline.
- Use two compact badge rows when badges add value: primary action/runtime/framework first, then version/port/status/deployment. Never add a badge for an unverified technology, license, public URL, or status.
- Add a centered navigation row linking to major README sections and version history.
- Explain localhost links: `127.0.0.1` works only on the machine running the service; LAN users need the server address.
- Provide short English and Thai "What is this?" sections before detailed technical material.
- Prefer one bilingual feature overview table over duplicated long feature lists.
- Use a small fenced-text flow for a meaningful user or data workflow. Omit it when the project has no useful sequence to explain.
- Document supported files, inputs, outputs, roles, or compatibility in tables when the project has several exact mappings.
- Include a concise technology stack, Quick Start, direct commands, configuration, repository structure, verification, and troubleshooting.
- Include backup, data handling, and source-control exclusions for stateful or sensitive applications.
- End with version history, maintainer/author information when verified, and a short centered project footer.

## Accuracy and adaptation rules

- Treat DataPEA and ADTD System as style references only. Never carry their names, versions, ports, frameworks, features, authors, licenses, commands, or security claims into another project.
- Do not claim that a feature is supported merely because a dependency is installed. Verify behavior in code or tests.
- Do not invent a logo. Use a repository asset when available; otherwise omit the image block or ask for one if branding is central to the request.
- Keep internal repositories safe: do not expose server addresses, email addresses, credentials, proprietary paths, account data, uploaded files, databases, secrets, or internal architecture beyond what the user has authorized for documentation.
- Match deployment guidance to the actual application. Distinguish source hosting, development environments, and production application hosting.
- Keep the README useful on common Git hosting renderers. Prefer Markdown, simple HTML alignment, ordinary tables, fenced code, and fenced-text diagrams; avoid renderer-specific complexity unless the target supports it.
- Use relative links for repository files and assets. Use descriptive labels for web links.
- Avoid decorative overload. Emojis and badges should establish hierarchy, not appear on every sentence.
- Preserve an existing license statement only when a license file or explicit user instruction supports it.

## Completion checklist

- The first screen explains what the project does, who it serves, and how to start it.
- All versions, ports, filenames, commands, URLs, and capabilities are verified.
- English and Thai content agree rather than contradicting each other.
- Tables render with consistent columns and alignment.
- Optional template placeholders and instructional comments are removed.
- Local links resolve, external links are appropriate, and no secrets or runtime data appear.
- Documented setup and tests are proportionate to the actual repository.
