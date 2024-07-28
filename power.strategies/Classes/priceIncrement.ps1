class priceIncrement {
    [double] $Price
    [double] $Increment

    priceIncrement([double]$Price, [double]$Increment) {
        $this.Price = $Price
        $this.Increment = $Increment
    }

    [string] ToString() {
        return "Price: $($this.Price), Increment: $($this.Increment)"
    }
}

# Creating an array of priceIncrement objects
$script:priceIncrements = @(
    [priceIncrement]::new(2, 0.01)
    [priceIncrement]::new(3, 0.02)
    [priceIncrement]::new(4, 0.05)
    [priceIncrement]::new(6, 0.1)
    [priceIncrement]::new(10, 0.2)
    [priceIncrement]::new(20, 0.5)
    [priceIncrement]::new(30, 1)
    [priceIncrement]::new(50, 2)
    [priceIncrement]::new(100, 5)
    [priceIncrement]::new(1000, 10)
)
