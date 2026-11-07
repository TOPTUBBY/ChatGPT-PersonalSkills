param(
  [string]$Repo = "TOPTUBBY/ChatGPT-CodexSkills",
  [string]$Ref = "feature/private-skill-plugins"
)
$ErrorActionPreference = "Stop"
if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
  Write-Error "Codex CLI was not found in PATH. Install/update Codex first, then run this script again."
}
Write-Host "Registering TOP Private Skills marketplace..." -ForegroundColor Cyan
$existing = (& codex plugin marketplace list 2>&1 | Out-String)
if ($existing -match "top-private-skills|ChatGPT-CodexSkills") {
  Write-Host "Marketplace appears to be registered. Upgrading instead..." -ForegroundColor Yellow
  & codex plugin marketplace upgrade
} else {
  & codex plugin marketplace add $Repo --ref $Ref --sparse .agents/plugins --sparse plugins
}
Write-Host ""
Write-Host "Registration complete." -ForegroundColor Green
Write-Host "Restart ChatGPT desktop, open Plugins, select 'TOP Private Skills', then install the bundle(s) you want."
Write-Host "Use either 'TOP All Skills' OR selected category bundles to avoid duplicate skill names."
