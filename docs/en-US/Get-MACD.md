---
external help file: power.strategies-help.xml
Module Name: power.strategies
online version: https://www.investopedia.com/terms/m/macd.asp
schema: 2.0.0
---

# Get-MACD

## SYNOPSIS
Calculates the Moving Average Convergence Divergence (MACD) for a given set of closing prices.

## SYNTAX

```
Get-MACD [-BackOdds] <Double[]> [[-ShortPeriod] <Int32>] [[-LongPeriod] <Int32>] [[-SignalPeriod] <Int32>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function calculates the Moving Average Convergence Divergence (MACD), a trend-following momentum indicator
that shows the relationship between two moving averages of a security's price.
The MACD is calculated by subtracting the 26-period Exponential Moving Average (EMA) from the 12-period EMA.
Additionally, a 9-period EMA of the MACD, called the "signal line," is plotted on top of the MACD line.

## EXAMPLES

### EXAMPLE 1
```
$prices = @(44.34, 44.09, 44.15, 43.61, 44.33, 44.83, 45.10, 45.42, 45.84, 46.08, 45.89, 46.03, 45.61, 46.28, 46.28, 46.00, 46.03, 46.41, 46.22, 45.64, 46.21)
Get-MACD -BackOdds $prices
```

This example calculates the MACD for the provided closing prices using the default periods (12, 26, 9).

## PARAMETERS

### -BackOdds
An array of closing prices for which the MACD is to be calculated.

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

### -ShortPeriod
The number of periods for the short-term EMA.
The default is 12.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
```

### -LongPeriod
The number of periods for the long-term EMA.
The default is 26.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 26
Accept pipeline input: False
Accept wildcard characters: False
```

### -SignalPeriod
The number of periods for the signal line EMA.
The default is 9.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 9
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

### PSCustomObject
### An object containing the MACD line, the signal line, and the MACD histogram values.
## NOTES
Author: Your Name
Date: Today's Date
Version: 1.0

## RELATED LINKS

[https://www.investopedia.com/terms/m/macd.asp](https://www.investopedia.com/terms/m/macd.asp)

