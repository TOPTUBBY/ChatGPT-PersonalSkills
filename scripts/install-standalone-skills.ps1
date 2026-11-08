param([switch]$All,[switch]$Personal,[string]$Skill="",[string]$Category="",[string]$Destination="$HOME\.agents\skills",[switch]$DryRun)
$ErrorActionPreference="Stop"
Push-Location (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
try {
  $py=if(Get-Command py -ErrorAction SilentlyContinue){"py"}elseif(Get-Command python -ErrorAction SilentlyContinue){"python"}else{throw "Python 3 required"}
  $argsList=@()
  if($py -eq "py"){$argsList+="-3"}
  $argsList+=@("scripts/install-standalone-skills.py","--dest",$Destination)
  if($All){$argsList+="--all"}elseif($Skill){$argsList+=@("--skill",$Skill)}elseif($Category){$argsList+=@("--category",$Category)}else{$argsList+="--personal"}
  if($DryRun){$argsList+="--dry-run"}
  & $py @argsList
  if($LASTEXITCODE -ne 0){throw "Standalone skill install failed"}
}finally{Pop-Location}
