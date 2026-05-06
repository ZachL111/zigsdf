$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot
python tests/test_casebook_pack.py
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
