param(
    [ValidateSet("Plugin","Standalone")][string]$Mode="Plugin",
    [switch]$Preview
)
$ErrorActionPreference="Stop"
$root=(Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Push-Location $root
try {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw "Git is required."
    }
    $branch=(& git branch --show-current).Trim()
    if($branch -ne "main") {
        throw "Switch this clone to main first: git fetch origin; git switch main"
    }
    & git pull --ff-only origin main
    if($LASTEXITCODE -ne 0) {throw "Git fast-forward pull failed. Resolve local changes before retrying."}
    if($Mode -eq "Plugin") {
        if(-not (Get-Command codex -ErrorAction SilentlyContinue)) {
            throw "Codex CLI with plugin support is required for Plugin mode."
        }
        & powershell -ExecutionPolicy Bypass -File .\scripts\register-private-marketplace.ps1
        if($LASTEXITCODE -ne 0){throw "Marketplace registration/update failed"}
        Write-Host "Marketplace updated. In Codex, enable personal-* plugins and review any old top-* installed plugins manually." -ForegroundColor Green
        Write-Host "Existing installed old plugin names cannot be reliably uninstalled by this script."
    } else {
        $installArgs=@("-All")
        if($Preview){$installArgs+="-DryRun"}
        & powershell -ExecutionPolicy Bypass -File .\scripts\install-standalone-skills.ps1 @installArgs
        if($LASTEXITCODE -ne 0){throw "Standalone installation failed"}
        Write-Host "Standalone skill folders updated. Restart Codex." -ForegroundColor Green
    }
} finally { Pop-Location }
