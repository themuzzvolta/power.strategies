<#
.SYNOPSIS
    Calculates the stake required using the Kelly Criterion method in betting.

.DESCRIPTION
    This function calculates the optimal stake for a bet using the Kelly Criterion method.
    The Kelly Criterion is used to determine the optimal size of a series of bets to maximize the logarithm of wealth.

.PARAMETER Odds
    The decimal odds of the bet.

.PARAMETER Probability
    The probability of winning the bet, expressed as a percentage.

.PARAMETER Bankroll
    The total amount of money available for betting.

.OUTPUTS
    System.Double
    The calculated stake required as per the Kelly Criterion method.

.EXAMPLE
    $stake = Get-KellyStake -Odds 3.5 -Probability 30 -Bankroll 1000
    $stake

    This example calculates the stake required for a bet with decimal odds of 3.5, a winning probability of 30%, and a bankroll of 1000.

.NOTES
    Author: Your Name
    Date: Today's Date
    Version: 1.0

#>

function Get-KellyStake {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [double] $Odds,

        [Parameter(Mandatory = $true)]
        [double] $Probability,

        [Parameter(Mandatory = $true)]
        [double] $Bankroll
    )

    process {
        if ($Odds -le 1) {
            throw "Decimal odds must be greater than 1."
        }

        if ($Probability -le 0 -or $Probability -ge 100) {
            throw "Probability must be between 0 and 100."
        }

        $probabilityWin = $Probability / 100
        $probabilityLose = 1 - $probabilityWin
        $kellyFraction = (($Odds - 1) * $probabilityWin - $probabilityLose) / ($Odds - 1)

        if ($kellyFraction -lt 0) {
            $kellyFraction = 0
        }

        $kellyStake = $kellyFraction * $Bankroll
        return [math]::Round($kellyStake, 2)
    }
}
