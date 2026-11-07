param([string]$Ref = "main")
$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Push-Location $root
try {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "Git is required." }
    $python = Get-Command py -ErrorAction SilentlyContinue
    if ($python) {
        & py -3 scripts/sync-upstream-skills.py --ref $Ref
    } elseif (Get-Command python -ErrorAction SilentlyContinue) {
        & python scripts/sync-upstream-skills.py --ref $Ref
    } else {
        throw "Python 3 is required."
    }
    if ($LASTEXITCODE -ne 0) { throw "OpenAI skill sync failed." }
    Write-Host "Skills synchronized into plugin folders. Review changes before pushing." -ForegroundColor Green
} finally { Pop-Location }
