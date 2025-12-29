# Internally needed function for consistency checks and data preparation.

Function is necessary for `eatRep` and `eatModel` as well and therefore
exported to namespace.

## Usage

``` r
existsBackgroundVariables (dat, variable, warnIfMissing = FALSE,
     stopIfMissingOnVars = NULL)
```

## Arguments

- dat:

  A data frame

- variable:

  vector of column number(s) or variable name(s)

- warnIfMissing:

  Logical: gives a warning if the variable contains missing values

- stopIfMissingOnVars:

  Character vector of variable names. Only for these variables, warnings
  as raised through `warnIfMissing = TRUE` are turned into errors.

## Value

a structured list of variable names

## Examples

``` r
# for more detailed examples, see help page of checkBackgroundVariables
data(mtcars)
existsBackgroundVariables(mtcars, 2:4)
#> [1] "cyl"  "disp" "hp"  
```
