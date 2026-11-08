#!/usr/bin/env bash
set -euo pipefail
command -v npx >/dev/null 2>&1 || { echo "Node.js/npm/npx is required." >&2; exit 1; }
source_repo="https://github.com/cloudflare/security-audit-skill"
if [[ "${1:-}" == "--local" ]]; then
  npx skills add "$source_repo" --skill security-audit
else
  npx skills add "$source_repo" --skill security-audit --global
fi
echo "Restart Codex and verify security-audit appears in your installed skills."
