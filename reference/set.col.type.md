# Set the Class of Columns in a Data Frame

This function converts the classes of columns to `character`, `numeric`,
`logical`, `integer` or `factor`.

## Usage

``` r
set.col.type(dat, col.type = list("character" = NULL), verbose = FALSE, ...)
```

## Arguments

- dat:

  A data frame

- col.type:

  A named list of column names that are to be converted. The names of
  the list indicate the class to which the respective column should be
  converted (`character`, `numeric`, `numeric.if.possible`, `logical`,
  `integer` or `factor`)

- verbose:

  if `TRUE` details about converted columns are printed on the console

- ...:

  Additional arguments to be passed to `asNumericIfPossible`

## Details

Use `col.type="numeric.if.possible"` if conversion to numeric should be
tested upfront, see `asNumericIfPossible` for details.

## Value

A data frame with column classes changed according to the specifications
in `col.type`

## Author

Martin Hecht, Karoline Sachse

## See also

`asNumericIfPossible`

## Examples

``` r
str(d <- data.frame("var1" = 1, "var2" = TRUE, "var3" = FALSE,
    "var4" = as.factor(1), "var5" = as.factor("a"),"var6" = "b",
    stringsAsFactors = FALSE))
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: num 1
#>  $ var2: logi TRUE
#>  $ var3: logi FALSE
#>  $ var4: Factor w/ 1 level "1": 1
#>  $ var5: Factor w/ 1 level "a": 1
#>  $ var6: chr "b"

str(set.col.type(d))
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: chr "1"
#>  $ var2: chr "TRUE"
#>  $ var3: chr "FALSE"
#>  $ var4: chr "1"
#>  $ var5: chr "a"
#>  $ var6: chr "b"
str(set.col.type(d, list("numeric" = NULL)))
#> Warning: NAs introduced by coercion
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: num 1
#>  $ var2: num 1
#>  $ var3: num 0
#>  $ var4: num 1
#>  $ var5: num 1
#>  $ var6: num NA
str(set.col.type(d, list("character" = c("var1" , "var2"),
    "numeric" = "var3", "logical" = "var4")))
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: chr "1"
#>  $ var2: chr "TRUE"
#>  $ var3: num 0
#>  $ var4: logi NA
#>  $ var5: Factor w/ 1 level "a": 1
#>  $ var6: chr "b"
str(set.col.type(d, list("numeric.if.possible" = NULL)))
#> Warning: Variable can not be transformed to numeric. Use force.string = TRUE to force this.
#> Warning: Variable can not be transformed to numeric. Use force.string = TRUE to force this.
#> Warning: Conversion of variable(s) var5, var6 to numeric.if.possible failed.
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: num 1
#>  $ var2: num 1
#>  $ var3: num 0
#>  $ var4: num 1
#>  $ var5: Factor w/ 1 level "a": 1
#>  $ var6: chr "b"
str(set.col.type(d, list("numeric.if.possible" = NULL),
    transform.factors = TRUE))
#> Warning: Variable can not be transformed to numeric. Use force.string = TRUE to force this.
#> Warning: Variable can not be transformed to numeric. Use force.string = TRUE to force this.
#> Warning: Conversion of variable(s) var5, var6 to numeric.if.possible failed.
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: num 1
#>  $ var2: num 1
#>  $ var3: num 0
#>  $ var4: num 1
#>  $ var5: Factor w/ 1 level "a": 1
#>  $ var6: chr "b"
str(set.col.type(d, list("numeric.if.possible" = NULL), transform.factors = TRUE,
    maintain.factor.scores = FALSE))
#> Warning: Variable can not be transformed to numeric. Use force.string = TRUE to force this.
#> Warning: Conversion of variable(s) var6 to numeric.if.possible failed.
#> 'data.frame':    1 obs. of  6 variables:
#>  $ var1: num 1
#>  $ var2: num 1
#>  $ var3: num 0
#>  $ var4: num 1
#>  $ var5: num 1
#>  $ var6: chr "b"
```
