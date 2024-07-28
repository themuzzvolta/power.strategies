<#
.SYNOPSIS
    Calculates the Relative Strength Index (RSI) for a given set of closing prices.

.DESCRIPTION
    This function calculates the Relative Strength Index (RSI), a popular momentum oscillator used in technical analysis.
    The RSI measures the speed and change of price movements and oscillates between 0 and 100.
    Traditionally, the RSI is considered overbought when above 70 and oversold when below 30.

.PARAMETER BackOdds
    An array of closing prices for which the RSI is to be calculated.

.PARAMETER Period
    The number of periods to use for the RSI calculation. The default is 14, which is a common period used in RSI calculations.

.OUTPUTS
    System.Double
    The calculated RSI value.

.EXAMPLE
    $prices = @(44.34, 44.09, 44.15, 43.61, 44.33, 44.83, 45.10, 45.42, 45.84, 46.08, 45.89, 46.03, 45.61, 46.28)
    Get-RSI -BackOdds $prices -Period 14

    This example calculates the RSI for the provided closing prices using a 14-period window.

.NOTES
    Author: Kurt Murray
    Date: 28/07/2024
    Version: 1.0

.LINK
    https://www.investopedia.com/terms/r/rsi.asp

#>

function Get-RSI {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [double[]] $BackOdds,

        [Parameter(Mandatory = $false)]
        [int] $Period = 14
    )

    process {
        if ($BackOdds.Length -lt $Period) {
            throw "The number of closing prices provided must be greater than or equal to the period."
        }

        $gains = 0.0
        $losses = 0.0

        for ($i = 1; $i -lt $Period; $i++) {
            $change = $BackOdds[$i] - $BackOdds[$i - 1]
            if ($change -gt 0) {
                $gains += $change
            } else {
                $losses -= $change
            }
        }

        $avgGain = $gains / $Period
        $avgLoss = $losses / $Period

        for ($i = $Period; $i -lt $BackOdds.Length; $i++) {
            $change = $BackOdds[$i] - $BackOdds[$i - 1]
            if ($change -gt 0) {
                $gain = $change
                $loss = 0
            } else {
                $gain = 0
                $loss = -$change
            }
            $avgGain = (($avgGain * ($Period - 1)) + $gain) / $Period
            $avgLoss = (($avgLoss * ($Period - 1)) + $loss) / $Period
        }

        if ($avgLoss -eq 0) {
            return 100
        } elseif ($avgGain -eq 0) {
            return 0
        }

        $rs = $avgGain / $avgLoss
        $rsi = 100 - (100 / (1 + $rs))

        return [math]::Round($rsi, 2)
    }
}
