# Posh-Sumologic
Hand commands for Sumologic.

# To test:
Download module -> run Posh-Sumologic.sandbox.ps1 to load.

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
