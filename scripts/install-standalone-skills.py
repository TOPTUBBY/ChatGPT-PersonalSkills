#!/usr/bin/env python3
"""Install standalone skills from unique category plugin folders. Python 3 stdlib only."""
import argparse, json, shutil
from pathlib import Path
ROOT=Path(__file__).resolve().parent.parent
def main():
 p=argparse.ArgumentParser(description=__doc__)
 g=p.add_mutually_exclusive_group(required=True)
 g.add_argument("--all",action="store_true")
 g.add_argument("--personal",action="store_true")
 g.add_argument("--skill")
 g.add_argument("--category")
 p.add_argument("--dest",type=Path,default=Path.home()/".agents"/"skills")
 p.add_argument("--dry-run",action="store_true")
 a=p.parse_args()
 mapping=json.loads((ROOT/"PERSONAL_SKILLS.json").read_text(encoding="utf-8"))["categories"]
 found={}
 for category in sorted((ROOT/"plugins").iterdir()):
  if not (category/"skills").is_dir(): continue
  for skill in sorted((category/"skills").iterdir()):
   if not (skill/"SKILL.md").is_file(): continue
   if skill.name in found: raise SystemExit(f"Duplicate skill: {skill.name}")
   found[skill.name]=skill
 if a.all: wanted=set(found)
 elif a.personal: wanted={s for xs in mapping.values() for s in xs}
 elif a.skill: wanted={a.skill}
 else: wanted={s.name for s in (ROOT/"plugins"/a.category/"skills").iterdir() if (s/"SKILL.md").is_file()} if (ROOT/"plugins"/a.category/"skills").is_dir() else set()
 if not wanted or wanted-set(found): raise SystemExit(f"Unknown/missing skills: {sorted(wanted-set(found))}")
 for name in sorted(wanted):
  source=found[name]; target=a.dest.expanduser().resolve()/name
  print(f"{name}: {source.relative_to(ROOT)} -> {target}")
  if a.dry_run: continue
  if target.is_symlink(): raise SystemExit(f"Refusing to overwrite symlink: {target}")
  if target.exists(): shutil.rmtree(target)
  target.parent.mkdir(parents=True,exist_ok=True)
  shutil.copytree(source,target,symlinks=False)
 print(f"{'Previewed' if a.dry_run else 'Installed'} {len(wanted)} unique skills.")
if __name__=="__main__": main()
