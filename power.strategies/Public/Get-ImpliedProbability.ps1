<#
.SYNOPSIS
    Calculates the implied probability from given decimal betting odds.

.DESCRIPTION
    This function calculates the implied probability from given decimal betting odds.
    The implied probability is a measure of the likelihood of a specific outcome occurring, derived from the decimal odds.

.PARAMETER BackOdds
    The decimal odds for which the implied probability is to be calculated. Decimal odds must be greater than 1.

.OUTPUTS
    System.Double
    The calculated implied probability as a percentage.

.EXAMPLE
    $probability = Get-ImpliedProbability -BackOdds 3.5
    $probability

    This example calculates the implied probability for decimal odds of 3.5.

.NOTES
    Author: Kurt Murray
    Date: 28/07/2024
    Version: 1.0

#>

function Get-ImpliedProbability {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [double] $BackOdds
    )

    process {
        if ($BackOdds -le 1) {
            throw "Decimal odds must be greater than 1."
        }

        $impliedProbability = (1 / $BackOdds) * 100
        return [math]::Round($impliedProbability, 2)
    }
}
