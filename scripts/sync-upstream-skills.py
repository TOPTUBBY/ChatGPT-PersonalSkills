#!/usr/bin/env python3
"""Build category-based OpenAI curated skills plugins; stdlib only.

Run in the repository root: python scripts/sync-upstream-skills.py
Requires git and online GitHub access. Does not touch personal TOP plugins.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / "UPSTREAM_SKILLS.json"
PLUGINS = ROOT / "plugins"
MARKETPLACE = ROOT / ".agents" / "plugins" / "marketplace.json"
BASE = "https://github.com/openai/skills.git"

def run(*cmd):
    return subprocess.run(cmd, check=True, text=True, capture_output=True).stdout.strip()

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--ref", default=None, help="Upstream branch, tag, or commit (default: catalog upstream_branch)")
    p.add_argument("--offline-src", default=None, help="Existing checkout of openai/skills (skip clone)")
    p.add_argument("--dry-run", action="store_true")
    args = p.parse_args()
    catalog = json.loads(CATALOG.read_text(encoding="utf-8"))
    mapping = catalog["categories"]
    all_names = [s for category in mapping for s in category["skills"]]
    if len(all_names) != len(set(all_names)):
        raise SystemExit("Duplicate skill mapping across categories!")
    if args.dry_run:
        for c in mapping:
            print(f'{c["name"]}: {len(c["skills"])} skill(s)')
        return

    with tempfile.TemporaryDirectory(prefix="top-skill-sync-") as temp:
        if args.offline_src:
            src = Path(args.offline_src).resolve()
        else:
            src = Path(temp) / "skills"
            ref = args.ref or catalog["upstream_branch"]
            run("git", "clone", "--depth", "1", "--branch", ref, "--", BASE, str(src))
        source_dir = src / catalog["upstream_base"]
        if not source_dir.is_dir():
            raise SystemExit(f"Upstream directory not found: {source_dir}")
        upstream_sha = run("git", "-C", str(src), "rev-parse", "HEAD") if (src / ".git").exists() else "offline"
        staging = Path(temp) / "generated"
        staging.mkdir()
        for c in mapping:
            package = staging / c["name"]
            skills_target = package / "skills"
            skills_target.mkdir(parents=True)
            for name in c["skills"]:
                original = source_dir / name
                if not (original / "SKILL.md").is_file():
                    raise SystemExit(f"Missing upstream SKILL.md: {original}")
                shutil.copytree(original, skills_target / name, symlinks=False)
            manifest = {
                "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
                "name": c["name"], "version": "1.0.0",
                "description": f"Official OpenAI curated skills: {c['displayName']} ({len(c['skills'])} skills).",
                "author": {"name": "OpenAI (skills authors); TOPTUBBY (private packaging)"},
                "repository": catalog["upstream"],
                "keywords": ["openai", "skills", "private", "curated"]
            }
            (package / "plugin.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
            compat = dict(name=c["name"], version="1.0.0", description=manifest["description"], skills="./skills/")
            (package / ".codex-plugin").mkdir()
            (package / ".codex-plugin" / "plugin.json").write_text(json.dumps(compat, indent=2) + "\n", encoding="utf-8")
            (package / "UPSTREAM.md").write_text(
                f"# Upstream provenance\n\nSource: {catalog['upstream']}\n\n"
                f"Commit: \`{upstream_sha}\`\n\n"
                f"Original paths: {catalog['upstream_base']}/<skill-name>/\n\n"
                "Each copied skill retains its own license files and resources. "
                "Do not alter upstream attribution.\n", encoding="utf-8"
            )

        existing = json.loads(MARKETPLACE.read_text(encoding="utf-8"))
        generated_names = {c["name"] for c in mapping}
        keep = [e for e in existing["plugins"] if e["name"] not in generated_names]
        add = []
        for c in mapping:
            add.append({
                "name":c["name"],
                "source":{"source":"local","path":"./plugins/" + c["name"]},
                "policy":{"installation":"AVAILABLE","authentication":"ON_INSTALL"},
                "category":"Developer Tools" if c["name"] in ("top-developer-tools","top-cloud-deployment","top-security-quality") else "Productivity",
                "interface":{"displayName":c["displayName"]}
            })
        # Validate all inputs before replacing previous generated folders.
        PLUGINS.mkdir(parents=True, exist_ok=True)
        for c in mapping:
            dest = PLUGINS / c["name"]
            if dest.is_symlink():
                raise SystemExit(f"Refusing to overwrite symlink: {dest}")
            if dest.exists():
                shutil.rmtree(dest)
            shutil.copytree(staging / c["name"], dest)
        existing["plugins"] = keep + add
        MARKETPLACE.write_text(json.dumps(existing, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print(f"Generated {len(mapping)} plugins, {len(all_names)} skills, upstream {upstream_sha}")
        print("Next: review 'git status' and commit changes to main.")

if __name__ == "__main__":
    main()
