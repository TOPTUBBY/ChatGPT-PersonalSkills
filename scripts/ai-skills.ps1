param(
 [Parameter(Mandatory=$true)][ValidateSet("claude-code","gemini-cli","codex","agents","cursor","claude-web","claude-plugin","gem")][string]$Target,
 [string]$Skill="", [string]$Category="", [switch]$All,
 [ValidateSet("user","project")][string]$Scope="user",
 [string]$Output="", [switch]$Force, [switch]$DryRun
)
$ErrorActionPreference="Stop"
Push-Location (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
try {
 $python=if(Get-Command py -ErrorAction SilentlyContinue){"py"}elseif(Get-Command python -ErrorAction SilentlyContinue){"python"}else{throw "Python 3 is required"}
 $a=@()
 if($python -eq "py"){$a+="-3"}
 $a+=@("scripts/ai-skills.py","--target",$Target,"--scope",$Scope)
 if($All){$a+="--all"}elseif($Skill){$a+=@("--skill",$Skill)}elseif($Category){$a+=@("--category",$Category)}else{throw "Supply -All, -Skill or -Category"}
 if($Output){$a+=@("--output",$Output)}
 if($Force){$a+="--force"}
 if($DryRun){$a+="--dry-run"}
 & $python @a
 if($LASTEXITCODE -ne 0){throw "Skill adapter failed"}
} finally {Pop-Location}
