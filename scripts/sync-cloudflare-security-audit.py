#!/usr/bin/env python3
"""Sync Cloudflare's MIT-licensed security-audit skill into TOP Security & Quality."""
import json
import shutil
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "plugins/top-security-quality"
SOURCE_URL = "https://github.com/cloudflare/security-audit-skill.git"

def main():
    with tempfile.TemporaryDirectory(prefix="cloudflare-security-audit-") as td:
        checkout = Path(td) / "upstream"
        subprocess.run(["git", "clone", "--depth", "1", SOURCE_URL, str(checkout)], check=True)
        revision = subprocess.run(["git", "-C", str(checkout), "rev-parse", "HEAD"],
                                  check=True, text=True, capture_output=True).stdout.strip()
        src = checkout / "skills" / "security-audit"
        if not (src / "SKILL.md").is_file():
            raise RuntimeError("Upstream security-audit/SKILL.md missing")
        dest = TARGET / "skills" / "security-audit"
        if dest.is_symlink():
            raise RuntimeError("Refusing to overwrite symlink")
        if dest.exists():
            shutil.rmtree(dest)
        shutil.copytree(src, dest)
        shutil.copy2(checkout / "LICENSE", dest / "LICENSE")
        manifest_path = TARGET / "plugin.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        manifest["version"] = "1.1.0"
        manifest["description"] = "Security and quality skills including Cloudflare's full source-auditing workflow, OpenAI security guidance, CI and monitoring."
        manifest["keywords"] = ["security", "audit", "cloudflare", "openai", "quality", "private"]
        manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
        overlay_path = TARGET / ".codex-plugin/plugin.json"
        overlay = json.loads(overlay_path.read_text(encoding="utf-8"))
        overlay["version"] = "1.1.0"
        overlay["description"] = manifest["description"]
        overlay_path.write_text(json.dumps(overlay, indent=2) + "\n", encoding="utf-8")
        (TARGET / "CLOUDFLARE_UPSTREAM.md").write_text(
            "# Cloudflare Security Audit Skill\n\n"
            f"Source: {SOURCE_URL}\n"
            f"Upstream commit: \`{revision}\`\n"
            "License: MIT, retained as skills/security-audit/LICENSE.\n\n"
            "This workflow can require Node.js, parallel coding agents, and an OS-enforced sandbox. "
            "A ChatGPT skills-only plugin alone does not provide the required execution environment.\n",
            encoding="utf-8")
        print(f"Synced security-audit from {revision}")

if __name__ == "__main__":
    main()
