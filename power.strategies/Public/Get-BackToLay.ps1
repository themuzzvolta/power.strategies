<#
.SYNOPSIS
    Calculates the Back to Lay strategy for a given set of odds and stakes.

.DESCRIPTION
    This function calculates the potential profit or loss from a Back to Lay betting strategy.
    It takes into account the initial back odds and stake, and the lay odds at which the bet is laid off.

.PARAMETER BackOdds
    The odds at which the initial bet is placed (back odds).

.PARAMETER BackStake
    The amount of money staked on the initial back bet.

.PARAMETER LayOdds
    The odds at which the bet is laid off (lay odds).

.PARAMETER Commission
    The commission rate charged by the betting exchange on winnings, expressed as a percentage. The default is 5%.

.OUTPUTS
    PSCustomObject
    An object containing the potential profit or loss from the Back to Lay strategy, both if the bet wins and if the bet loses.

.EXAMPLE
    $result = Get-BackToLay -BackOdds 3.5 -BackStake 100 -LayOdds 2.5
    $result

    This example calculates the potential profit or loss from a Back to Lay strategy where the initial back bet is placed at odds of 3.5 with a stake of 100,
    and the bet is laid off at odds of 2.5.

.NOTES
    Author: Kurt Murray
    Date: 28/07/2024
    Version: 1.0

#>

function Get-BackToLay {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [double] $BackOdds,

        [Parameter(Mandatory = $true)]
        [double] $BackStake,

        [Parameter(Mandatory = $true)]
        [double] $LayOdds,

        [Parameter(Mandatory = $false)]
        [double] $Commission = 5
    )

    process {
        $layStake = [math]::Round($BackStake * $BackOdds / $LayOdds, 2)
        $layLiability = $layStake * ($LayOdds - 1)

        # Calculate potential profit or loss if the selection wins
        $winProfit = ($BackStake * ($BackOdds - 1)) - $layLiability
        $winProfitAfterCommission = $winProfit * (1 - $Commission / 100)

        # Calculate potential profit or loss if the selection loses
        $loseProfit = $layStake - $BackStake

        $result = [PSCustomObject]@{
            BackStake               = $BackStake
            LayStake                = $layStake
            LayLiability            = $layLiability
            ProfitIfWins            = [math]::Round($winProfitAfterCommission, 2)
            ProfitIfLoses           = [math]::Round($loseProfit, 2)
        }

        return $result
    }
}
