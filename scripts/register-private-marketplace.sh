#!/usr/bin/env bash
set -euo pipefail
REPO="${1:-TOPTUBBY/ChatGPT-PersonalSkills}"
REF="${2:-main}"
command -v codex >/dev/null 2>&1 || { echo "Codex CLI was not found in PATH." >&2; exit 1; }
if codex plugin marketplace list 2>&1 | grep -Eq "personal-skills-marketplace|ChatGPT-PersonalSkills"; then
  codex plugin marketplace upgrade
else
  codex plugin marketplace add "$REPO" --ref "$REF" --sparse .agents/plugins --sparse plugins
fi
echo
echo "Registration complete."
echo "Restart ChatGPT desktop, open Plugins, select 'Personal Skills Marketplace', then install the bundle(s) you want."
