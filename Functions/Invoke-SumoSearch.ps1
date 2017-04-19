<#
.SYNOPSIS
    Sumologic Fu
.DESCRIPTION
    Search in sumo
.EXAMPLE
    Invoke-SumoSearch -Minutes 10 -Query {_sourcecategory=blah!} -Filter "any keywords to filter your search"
#>

function Invoke-SumoSearch {
  param(
      [Parameter(Mandatory=$false)]
      [string]$Minutes = "15",
      [string]$Query,
      [string]$Filter
  )
  process{
      $Query = $Query  + " " + "$Filter"
      $searchresults = Start-SearchJob -Query "$Query" -Last ([TimeSpan]::FromMinutes($Minutes))
      $searchid = $searchresults.id
      Get-SearchResult -Id $searchid
    }
} # end function
