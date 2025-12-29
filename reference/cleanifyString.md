# Removes special characters

Removes special characters from a character string. Also applicable to
factor variables and `data.frames`.

## Usage

``` r
cleanifyString(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
              oldEncoding = NULL, ...)
```

## Arguments

- x:

  a character variable, factor variable or `data.frame`

- removeNonAlphaNum:

  logical. If `TRUE`, all non-alphanumeric characters are removed.
  Default is `TRUE`.

- replaceSpecialChars:

  logical. If `TRUE`, special characters are replaced. Default is
  `TRUE`.

- oldEncoding:

  character. The encoding of the input data if it should be transformed
  to `"UTF-8"`.

- ...:

  further arguments passed to other methods.

## Details

If unwanted characters are removed from a character string in a factor
variable, this can lead to a change in the factor structure (according
to the reference category, for example). `cleanifyString` restores the
factor structure after removing special characters. Function is mainly
used internally in the `eatRep`, `eatGADS`, and `eatModel` packages.

## Value

a character variable, factor variable or `data.frame` with removed
special characters

## Examples

``` r
fac1 <- factor(c("Tablet-Paper", "Computer.(Laptop)", "Computer.(Laptop)"),
               levels = c("Tablet-Paper", "Computer.(Laptop)"))
table(fac1)
#> fac1
#>      Tablet-Paper Computer.(Laptop) 
#>                 1                 2 

# Remove special characters
fac2 <- cleanifyString(fac1)
fac2
#> [1] TabletPaper    ComputerLaptop ComputerLaptop
#> Levels: TabletPaper ComputerLaptop
```
