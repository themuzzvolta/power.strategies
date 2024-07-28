---
external help file: power.strategies-help.xml
Module Name: power.strategies
online version:
schema: 2.0.0
---

# Get-EMA

## SYNOPSIS
Calculates the Exponential Moving Average (EMA) for a given set of data points.

## SYNTAX

```
Get-EMA [-DataPoints] <Double[]> [-Period] <Int32> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function calculates the Exponential Moving Average (EMA) for a given set of data points.
The EMA gives more weight to the most recent data points, making it more responsive to new information compared to the Simple Moving Average (SMA).

## EXAMPLES

### EXAMPLE 1
```
$data = @(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
$ema = Get-EMA -DataPoints $data -Period 5
$ema
```

This example calculates the EMA for the provided data points using a 5-period window.

## PARAMETERS

### -DataPoints
An array of numerical data points for which the EMA is to be calculated.

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
The number of periods to use for the EMA calculation.
This determines the weight of the latest data points.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
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

### System.Double[]
### The calculated EMA values for the data points.
## NOTES
Author: Your Name
Date: Today's Date
Version: 1.0

## RELATED LINKS
