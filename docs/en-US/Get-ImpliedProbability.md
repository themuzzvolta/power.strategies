---
external help file: power.strategies-help.xml
Module Name: power.strategies
online version:
schema: 2.0.0
---

# Get-ImpliedProbability

## SYNOPSIS
Calculates the implied probability from given decimal betting odds.

## SYNTAX

```
Get-ImpliedProbability [-BackOdds] <Double> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function calculates the implied probability from given decimal betting odds.
The implied probability is a measure of the likelihood of a specific outcome occurring, derived from the decimal odds.

## EXAMPLES

### EXAMPLE 1
```
$probability = Get-ImpliedProbability -BackOdds 3.5
$probability
```

This example calculates the implied probability for decimal odds of 3.5.

## PARAMETERS

### -BackOdds
The decimal odds for which the implied probability is to be calculated.
Decimal odds must be greater than 1.

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

### System.Double
### The calculated implied probability as a percentage.
## NOTES
Author: Kurt Murray
Date: 28/07/2024
Version: 1.0

## RELATED LINKS
