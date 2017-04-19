<#
.SYNOPSIS
    Sumologic Fu
.DESCRIPTION
    Create a new Sumologic session
.EXAMPLE
    Use-SumoCredential -Zone US2
#>

function Use-SumoCredential {
  param(
      [Parameter(Mandatory=$false)]
      [string]$SumoKey = $env:SumoKey,
      [string]$SumoID = $env:SumoID,
      [Parameter(Mandatory=$true)]
      [ValidateSet("Prod","Sydney","Dublin","US2")]
      [string]$Zone
  )

  process{
      # Authenticate
      New-SumoSession -Deployment $Zone -AccessId $SumoID -AccessKey $SumoKey
    }
}
