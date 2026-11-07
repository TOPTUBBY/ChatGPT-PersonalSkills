$ErrorActionPreference = "Stop"
if (-not (Get-Command codex -ErrorAction SilentlyContinue)) { Write-Error "Codex CLI was not found in PATH." }
Write-Host "Updating configured plugin marketplaces..." -ForegroundColor Cyan
& codex plugin marketplace upgrade
Write-Host "Update complete. Restart ChatGPT desktop if needed." -ForegroundColor Green
