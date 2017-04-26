<#
.SYNOPSIS
    Sumologic Fu
.DESCRIPTION
    Send input to sumo collector
.EXAMPLE
    Write-SumoLog -Comment "$comment"
#>

function Write-SumoLog {
  param(
      [Parameter(Mandatory=$True)]
      [string]$Comment,

      [Parameter(Mandatory=$false)]
      [string]$CollectorName,
      [string]$CollectorUrl,
      [switch]$ForceRefresh
  )
  begin {
      if (-NOT $script:CacheSumologicCollectors -Or $ForceRefresh) {
          $script:CacheSumologicCollectors = @()
          Write-Warning "Write-SumoLog is caching Collectors."
          Write-Verbose "Fetching collectors..."
          try{
            $script:CacheSumologicCollectors += Get-Collector -Limit 999999 -Offset 1
            Write-Verbose "Cached collectors count $($script:CacheSumologicCollectors.Count)"
          }
          catch{
            Write-Verbose "Run: Use-SumoCredential to authenticate. This is a new session."
          }
      } else {
          Write-Warning "Write-SumoLog is running in collectors cached mode."
          Write-Warning "Use -ForceRefresh if you wish to avoid this behavior."
      }
  }
  process {
      $Collector = $script:CacheSumologicCollectors | Where-Object {$_.name -like "*$CollectorName*"}
      $CollectorUrl = ($Collector | Get-Source).url
      Invoke-WebRequest "$CollectorUrl'?[$Comment]" -UseBasicParsing -Verbose
    }
} # end function
