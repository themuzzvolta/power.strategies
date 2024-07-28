<#
.SYNOPSIS
    Calculates the Moving Average Convergence Divergence (MACD) for a given set of closing prices.

.DESCRIPTION
    This function calculates the Moving Average Convergence Divergence (MACD), a trend-following momentum indicator
    that shows the relationship between two moving averages of a security’s price.
    The MACD is calculated by subtracting the 26-period Exponential Moving Average (EMA) from the 12-period EMA.
    Additionally, a 9-period EMA of the MACD, called the "signal line," is plotted on top of the MACD line.

.PARAMETER BackOdds
    An array of closing prices for which the MACD is to be calculated.

.PARAMETER ShortPeriod
    The number of periods for the short-term EMA. The default is 12.

.PARAMETER LongPeriod
    The number of periods for the long-term EMA. The default is 26.

.PARAMETER SignalPeriod
    The number of periods for the signal line EMA. The default is 9.

.OUTPUTS
    PSCustomObject
    An object containing the MACD line, the signal line, and the MACD histogram values.

.EXAMPLE
    $prices = @(44.34, 44.09, 44.15, 43.61, 44.33, 44.83, 45.10, 45.42, 45.84, 46.08, 45.89, 46.03, 45.61, 46.28, 46.28, 46.00, 46.03, 46.41, 46.22, 45.64, 46.21)
    Get-MACD -BackOdds $prices

    This example calculates the MACD for the provided closing prices using the default periods (12, 26, 9).

.NOTES
    Author: Kurt Murray
    Date: 28/07/2024
    Version: 1.0

.LINK
    https://www.investopedia.com/terms/m/macd.asp

#>

function Get-MACD {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [double[]] $BackOdds,

        [Parameter(Mandatory = $false)]
        [int] $ShortPeriod = 12,

        [Parameter(Mandatory = $false)]
        [int] $LongPeriod = 26,

        [Parameter(Mandatory = $false)]
        [int] $SignalPeriod = 9
    )

    function Get-EMA {
        param (
            [double[]] $Prices,
            [int] $Period
        )
        $multiplier = 2 / ($Period + 1)
        $ema = @($Prices[0])
        for ($i = 1; $i -lt $Prices.Length; $i++) {
            $ema += [math]::Round((($Prices[$i] - $ema[-1]) * $multiplier) + $ema[-1], 2)
        }
        return $ema
    }


    if ($BackOdds.Length -lt $LongPeriod) {
        throw "The number of closing prices provided must be greater than or equal to the longest period."
    }

    $shortEMA = Get-EMA -Prices $BackOdds -Period $ShortPeriod
    $longEMA = Get-EMA -Prices $BackOdds -Period $LongPeriod

    $macdLine = @()
    for ($i = 0; $i -lt $shortEMA.Length; $i++) {
        $macdLine += [math]::Round($shortEMA[$i] - $longEMA[$i], 2)
    }

    $signalLine = Get-EMA -Prices $macdLine -Period $SignalPeriod

    $macdHistogram = @()
    for ($i = 0; $i -lt $signalLine.Length; $i++) {
        $macdHistogram += [math]::Round($macdLine[$i] - $signalLine[$i], 2)
    }

    $result = [PSCustomObject]@{
        MACDLine      = $macdLine
        SignalLine    = $signalLine
        MACDHistogram = $macdHistogram
    }

    return $result

}
