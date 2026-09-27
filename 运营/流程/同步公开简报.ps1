$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$workspaceRoot = (Split-Path $repoRoot -Parent)
$sourceRoot = Join-Path $workspaceRoot 'output'
$targetRoot = Join-Path $repoRoot '运营\简报'

if (-not (Test-Path $sourceRoot)) {
    throw "找不到本地内容生成目录: $sourceRoot"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
$files = Get-ChildItem -LiteralPath $sourceRoot -File -Force |
    Where-Object { $_.Name -match '^ai-(hot|med)-briefing-\d{4}-\d{2}-\d{2}\.html$' }

if ($files.Count -eq 0) {
    throw '没有找到可同步的公开简报 HTML。'
}

$files | Copy-Item -Destination $targetRoot -Force
Write-Output ("已同步 {0} 个公开简报到 {1}" -f $files.Count, $targetRoot)
