#!/usr/bin/env bash
set -euo pipefail
command -v codex >/dev/null 2>&1 || { echo "Codex CLI was not found in PATH." >&2; exit 1; }
codex plugin marketplace upgrade
echo "Update complete. Restart ChatGPT desktop if needed."
