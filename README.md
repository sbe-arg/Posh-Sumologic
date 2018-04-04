Posh-Sumologic module
===================

[![Build status](https://ci.appveyor.com/api/projects/status/rgp57t50niffdl42?svg=true)](https://ci.appveyor.com/project/sbe-arg/posh-sumologic)

## To test/debug:
Download module -> run Posh-Sumologic.sandbox.ps1 to load.

## Install via PowershellLibrary
```powershell
PowerShellGet\Install-Module Posh-Sumologic -Scope CurrentUser
```
### Or install/update via PsGet
```powershell
psget\Install-Module -ModuleUrl https://github.com/sbe-arg/Posh-Sumologic/archive/master.zip # -update
```

## cmdlets
```powershell
# Open a sumo session:
Use-SumoCredential -Zone US2
# Query Sumo:
Invoke-SumoSearch -Minutes 10 -Query {_sourcecategory=blah!} -Filter "any keywords to filter your search"
# Send Sumo logs:
Write-SumoLog -Comment "$comment"
```


# Open Source:
I have no affiliation with Sumologic, take a copy and do whatever :)

Requires: https://github.com/SumoLogic/sumo-powershell-sdk
