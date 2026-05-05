$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

$knownPaths = @(
  "C:\Program Files\Git\cmd",
  "C:\Python313",
  "C:\Program Files\nodejs",
  "C:\Program Files\Go\bin",
  "C:\Strawberry\c\bin",
  "C:\Program Files\dotnet",
  "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\*\bin\Hostx64\x64",
  "$env:USERPROFILE\.cargo\bin",
  "$env:USERPROFILE\tools\kotlin\kotlinc\bin",
  "$env:USERPROFILE\tools\elixir\bin",
  "$env:USERPROFILE\tools\solidity",
  "$env:USERPROFILE\tools\foundry",
  "$env:USERPROFILE\tools\scala-cli",
  "$env:LOCALAPPDATA\Microsoft\WinGet\Links",
  "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\PHP.PHP.8.3_Microsoft.Winget.Source_8wekyb3d8bbwe",
  "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Google.DartSDK_Microsoft.Winget.Source_8wekyb3d8bbwe\dart-sdk\bin",
  "$env:APPDATA\local\bin",
  "$env:LOCALAPPDATA\Programs\Julia-1.12.6\bin",
  "$env:LOCALAPPDATA\Programs\DkMLNative\usr\bin",
  "$env:LOCALAPPDATA\Programs\Lua\bin",
  "$env:LOCALAPPDATA\Programs\Swift\Toolchains\*\usr\bin",
  "$env:LOCALAPPDATA\Programs\Swift\Runtimes\*\usr\bin",
  "$env:LOCALAPPDATA\Programs\stack\x86_64-windows\ghc-9.10.3\bin",
  "C:\Program Files\Erlang OTP\bin",
  "C:\Program Files\R\R-4.6.0\bin\x64",
  "C:\Program Files\Microsoft\jdk-17.0.19.10-hotspot\bin",
  "C:\Program Files\Eclipse Adoptium\jdk-17*\bin",
  "C:\Program Files\Java\jdk-17*\bin",
  "C:\Ruby33-x64\bin",
  "C:\Ruby34-x64\bin",
  "C:\Program Files\Swift\Toolchains\*\usr\bin",
  "C:\Program Files\Swift\Runtimes\*\usr\bin",
  "C:\Program Files\Zig",
  "C:\Program Files\Lua\bin",
  "C:\Program Files\PHP\*",
  "C:\Program Files\Dart\dart-sdk\bin",
  "C:\Program Files\SQLite",
  "C:\Program Files\Scala\bin",
  "C:\Program Files (x86)\scala\bin"
)

foreach ($pathPattern in $knownPaths) {
  $resolved = Get-ChildItem -Path $pathPattern -ErrorAction SilentlyContinue | ForEach-Object {
    if ($_.PSIsContainer) { $_.FullName } else { $_.DirectoryName }
  }
  if (-not $resolved -and (Test-Path $pathPattern)) {
    $resolved = @($pathPattern)
  }
  foreach ($path in @($resolved)) {
    if ($path -and (($env:Path -split ";") -notcontains $path)) {
      $env:Path = "$path;$env:Path"
    }
  }
}

zig test src/main.zig
