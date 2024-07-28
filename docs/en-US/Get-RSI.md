---
external help file: power.strategies-help.xml
Module Name: power.strategies
online version: https://www.investopedia.com/terms/r/rsi.asp
schema: 2.0.0
---

# Get-RSI

## SYNOPSIS
Calculates the Relative Strength Index (RSI) for a given set of closing prices.

## SYNTAX

```
Get-RSI [-BackOdds] <Double[]> [[-Period] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function calculates the Relative Strength Index (RSI), a popular momentum oscillator used in technical analysis.
The RSI measures the speed and change of price movements and oscillates between 0 and 100.
Traditionally, the RSI is considered overbought when above 70 and oversold when below 30.

## EXAMPLES

### EXAMPLE 1
```
$prices = @(44.34, 44.09, 44.15, 43.61, 44.33, 44.83, 45.10, 45.42, 45.84, 46.08, 45.89, 46.03, 45.61, 46.28)
Get-RSI -BackOdds $prices -Period 14
```

This example calculates the RSI for the provided closing prices using a 14-period window.

## PARAMETERS

### -BackOdds
An array of closing prices for which the RSI is to be calculated.

```yaml
Type: Double[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Period
The number of periods to use for the RSI calculation.
The default is 14, which is a common period used in RSI calculations.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 14
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Double
### The calculated RSI value.
## NOTES
Author: Kurt Murray
Date: 28/07/2024
Version: 1.0

## RELATED LINKS

[https://www.investopedia.com/terms/r/rsi.asp](https://www.investopedia.com/terms/r/rsi.asp)

