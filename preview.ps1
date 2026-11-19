param(
    [switch]$Rebuild,
    [ValidateRange(1, 65535)]
    [int]$Port = 4000
)

$ErrorActionPreference = 'Stop'
Push-Location -LiteralPath $PSScriptRoot
try {
    if ($Rebuild -or !(Test-Path -LiteralPath '_site/index.html')) {
        if (Get-Command bundle -ErrorAction SilentlyContinue) {
            & bundle exec jekyll build
        } else {
            & wsl -d Ubuntu -- bundle exec jekyll build
        }
        if ($LASTEXITCODE -ne 0) { throw 'Jekyll build failed.' }
    }
    Write-Host "English  http://127.0.0.1:$Port/"
    Write-Host "Chinese  http://127.0.0.1:$Port/zh/"
    & python -m http.server $Port --bind 127.0.0.1 --directory _site
    if ($LASTEXITCODE -ne 0) { throw 'Preview server stopped with an error.' }
} finally {
    Pop-Location
}
