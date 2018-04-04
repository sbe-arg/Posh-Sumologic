Write-Verbose "Posh-Sumologic module"
Write-Verbose 'Doing stuff...'

# load functions
  $functionFilter = Join-Path $PSScriptRoot "Functions"
  Get-ChildItem -Path $functionFilter -Filter "*.ps1" -Recurse |
  Foreach-Object {
      Write-Verbose "Loading function $($_.Name).."
      . $_.FullName
  }

  if(-not $env:SumoKey){
    Write-Warning "Cannot find Sumologic Key on this system."
    Write-Warning 'Save it as $env:SumoKey using: [Environment]::SetEnvironmentVariable("SumoKey", "$sumoKey", "User")'
  }
  if(-not $env:SumoID){
    Write-Warning "Cannot find Sumoloc ID on this system."
    Write-Warning 'Save it as $env:SumoID using: [Environment]::SetEnvironmentVariable("SumoID", "$sumoID", "User")'
  }

Write-Verbose 'Done!'
