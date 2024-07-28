<#
.SYNOPSIS
    Calculates the Exponential Moving Average (EMA) for a given set of data points.

.DESCRIPTION
    This function calculates the Exponential Moving Average (EMA) for a given set of data points.
    The EMA gives more weight to the most recent data points, making it more responsive to new information compared to the Simple Moving Average (SMA).

.PARAMETER DataPoints
    An array of numerical data points for which the EMA is to be calculated.

.PARAMETER Period
    The number of periods to use for the EMA calculation. This determines the weight of the latest data points.

.OUTPUTS
    System.Double[]
    The calculated EMA values for the data points.

.EXAMPLE
    $data = @(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
    $ema = Get-EMA -DataPoints $data -Period 5
    $ema

    This example calculates the EMA for the provided data points using a 5-period window.

.NOTES
    Author: Your Name
    Date: Today's Date
    Version: 1.0

#>

function Get-EMA {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [double[]] $DataPoints,

        [Parameter(Mandatory = $true)]
        [int] $Period
    )

    process {
        if ($DataPoints.Length -lt $Period) {
            throw "The number of data points provided must be greater than or equal to the period."
        }

        $multiplier = 2 / ($Period + 1)
        $ema = @()
        $sma = ($DataPoints | Select-Object -First $Period | Measure-Object -Sum).Sum / $Period
        $ema += [math]::Round($sma, 2)

        for ($i = $Period; $i -lt $DataPoints.Length; $i++) {
            $newEMA = ($DataPoints[$i] - $ema[-1]) * $multiplier + $ema[-1]
            $ema += [math]::Round($newEMA, 2)
        }

        return $ema
    }
}
