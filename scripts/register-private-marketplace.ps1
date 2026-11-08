param(
  [string]$Repo = "TOPTUBBY/ChatGPT-CodexSkills",
  [string]$Ref = "main"
)
$ErrorActionPreference = "Stop"
if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
  Write-Error "Codex CLI was not found in PATH. Install/update Codex first, then run this script again."
}
Write-Host "Registering Personal Skills Marketplace marketplace..." -ForegroundColor Cyan
$existing = (& codex plugin marketplace list 2>&1 | Out-String)
if ($existing -match "personal-skills-marketplace|ChatGPT-CodexSkills") {
  Write-Host "Marketplace appears to be registered. Upgrading instead..." -ForegroundColor Yellow
  & codex plugin marketplace upgrade
} else {
  & codex plugin marketplace add $Repo --ref $Ref --sparse .agents/plugins --sparse plugins
}
Write-Host ""
Write-Host "Registration complete." -ForegroundColor Green
Write-Host "Restart ChatGPT desktop, open Plugins, select 'Personal Skills Marketplace', then install the bundle(s) you want."
Write-Host "Install only the category bundles you need; avoid duplicate standalone skill installations."
