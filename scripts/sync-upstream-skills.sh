#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 scripts/sync-upstream-skills.py --ref "${1:-main}"
echo "Skills synchronized. Review changes before pushing."
