<#
.SYNOPSIS
    Calculates the Expected Value (EV) for a given set of odds and probabilities in betting.

.DESCRIPTION
    This function calculates the Expected Value (EV) of a bet, which is a measure of the average outcome of the bet if it were placed many times.
    The EV helps to understand the potential profitability of a bet over the long term.
    It takes into account the odds, the stake, and the probability of winning.

.PARAMETER Odds
    The odds at which the bet is placed.

.PARAMETER Stake
    The amount of money staked on the bet.

.PARAMETER Probability
    The probability of the bet winning, expressed as a percentage.

.OUTPUTS
    System.Double
    The calculated Expected Value (EV) of the bet.

.EXAMPLE
    $ev = Get-ExpectedValue -Odds 3.5 -Stake 100 -Probability 30
    $ev

    This example calculates the Expected Value (EV) of a bet placed at odds of 3.5 with a stake of 100 and a winning probability of 30%.

.NOTES
    Author: Your Name
    Date: Today's Date
    Version: 1.0

#>

function Get-ExpectedValue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [double] $Odds,

        [Parameter(Mandatory = $true)]
        [double] $Stake,

        [Parameter(Mandatory = $true)]
        [double] $Probability
    )

    process {
        $probabilityWin = $Probability / 100
        $probabilityLose = 1 - $probabilityWin

        $winAmount = $Stake * ($Odds - 1)
        $expectedValue = ($winAmount * $probabilityWin) - ($Stake * $probabilityLose)

        return [math]::Round($expectedValue, 2)
    }
}
