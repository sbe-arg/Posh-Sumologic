# Load module from the local filesystem, instead from the ModulePath
Remove-Module Posh-Sumologic -Force -ErrorAction SilentlyContinue
Import-Module (Split-Path $PSScriptRoot -Parent)

$Script:ModuleName = 'Posh-Sumologic'
$script:FunctionPath = Resolve-Path (Join-Path $PSScriptRoot '../Functions')
