---
external help file: power.strategies-help.xml
Module Name: power.strategies
online version:
schema: 2.0.0
---

# Get-KellyStake

## SYNOPSIS
Calculates the stake required using the Kelly Criterion method in betting.

## SYNTAX

```
Get-KellyStake [-Odds] <Double> [-Probability] <Double> [-Bankroll] <Double>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function calculates the optimal stake for a bet using the Kelly Criterion method.
The Kelly Criterion is used to determine the optimal size of a series of bets to maximize the logarithm of wealth.

## EXAMPLES

### EXAMPLE 1
```
$stake = Get-KellyStake -Odds 3.5 -Probability 30 -Bankroll 1000
$stake
```

This example calculates the stake required for a bet with decimal odds of 3.5, a winning probability of 30%, and a bankroll of 1000.

## PARAMETERS

### -Odds
The decimal odds of the bet.

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

### -Probability
The probability of winning the bet, expressed as a percentage.

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Bankroll
The total amount of money available for betting.

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
### The calculated stake required as per the Kelly Criterion method.
## NOTES
Author: Your Name
Date: Today's Date
Version: 1.0

## RELATED LINKS
