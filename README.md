# Posh-Sumologic
Hand commands for Sumologic.

# To test/debug:
Download module -> run Posh-Sumologic.sandbox.ps1 to load.

### Step One: Install psget
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
(new-object Net.WebClient).DownloadString("https://raw.githubusercontent.com/psget/psget/master/GetPsGet.ps1") | iex
```


### Step Two: Install Posh-Sumologic
```powershell
psget\Install-Module -ModuleUrl https://github.com/sbe-arg/Posh-Sumologic/archive/master.zip
```

## Upgrading
From time-to-time *Posh-Sumologic* will be updated to include new features.
To update *Posh-Sumologic*, execute the following:
```powershell
psget\Install-Module -ModuleUrl https://github.com/sbe-arg/Posh-Sumologic/archive/master.zip -Update
```

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
