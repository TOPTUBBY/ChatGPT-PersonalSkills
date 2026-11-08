param(
    [switch]$Global = $true
)
$ErrorActionPreference = "Stop"
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    throw "Node.js/npm/npx is required. Install Node.js LTS, then reopen PowerShell."
}
$source = "https://github.com/cloudflare/security-audit-skill"
Write-Host "Installing Cloudflare security-audit as a standalone agent skill..." -ForegroundColor Cyan
Write-Host "Source: $source"
if ($Global) {
    & npx skills add $source --skill security-audit --global
} else {
    & npx skills add $source --skill security-audit
}
if ($LASTEXITCODE -ne 0) { throw "Skill installation did not complete successfully." }
Write-Host "Installer completed. Restart Codex and verify the security-audit skill is listed." -ForegroundColor Green
Write-Host "The TOP Security & Quality Personal Plugin remains installed separately."
