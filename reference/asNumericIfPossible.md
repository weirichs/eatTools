# Convert a Vector, Matrix or Data Frame Into Numeric Values If Possible

This function converts vectors and matrices of all kinds to `numeric`.
The function can also be used to convert all columns of a `data.frame`
to class `numeric` for which this conversion is possible i.e. without
creating `NA` when it fails. Non-convertible columns are maintained.

## Usage

``` r
asNumericIfPossible(x, maintain.factor.scores = TRUE, force.string = TRUE,
transform.factors = TRUE, varName = NULL)
```

## Arguments

- x:

  A vector or data frame which should be converted.

- maintain.factor.scores:

  Logical: If `TRUE`, conversion of the factor levels is attempted (like
  in `as.numeric(as.character(f))`). If `FALSE`, the internal codes of
  the factor are returned (like in `as.numeric(f)`). See 'Details'. This
  argument is only evaluated if `transform.factors = TRUE`.

- force.string :

  Logical indicating whether columns should be force to numeric, even if
  NAs are induced. If `FALSE`, affected columns are maintained. If
  `TRUE`, conversion is forced.

- transform.factors :

  Logical indicating whether columns of class `factor` should be
  converted. If `FALSE`, columns of class `factor` are maintained. If
  `TRUE`, conversion of factors is attempted.

- varName :

  Optional: Name of the corresponding variable. Doesn't have to be
  changed by user.

## Details

In R, factors may represent ordered categories or categorical variables.
Depending on the meaning of the variable, a conversion of the nominal
values (of a factor variable) to numeric values may be desirable or not.
The arguments `transform.factors` and `maintain.factor.scores` specify
if and how factor variables should be treated. See examples.

## Author

Sebastian Weirich, Karoline Sachse, Benjamin Becker

## Examples

``` r
dat <- data.frame(X1 = c("1",NA,"0"), X2 = c("a",NA,"b"),
                  X3 = c(TRUE,FALSE,FALSE), X4 = as.factor(c("a",NA,"b")),
                  X5 = as.factor(c("5","6","7")), stringsAsFactors = FALSE)
str(dat)
#> 'data.frame':    3 obs. of  5 variables:
#>  $ X1: chr  "1" NA "0"
#>  $ X2: chr  "a" NA "b"
#>  $ X3: logi  TRUE FALSE FALSE
#>  $ X4: Factor w/ 2 levels "a","b": 1 NA 2
#>  $ X5: Factor w/ 3 levels "5","6","7": 1 2 3
asNumericIfPossible(dat)
#> Warning: 'X2' has been coerced to numeric, NAs have been induced.
#> Warning: 'X4' has been coerced to numeric, NAs have been induced.
#>   X1 X2 X3 X4 X5
#> 1  1 NA  1 NA  5
#> 2 NA NA  0 NA  6
#> 3  0 NA  0 NA  7
asNumericIfPossible(dat, transform.factors=TRUE,
                      maintain.factor.scores=FALSE)
#> Warning: 'X2' has been coerced to numeric, NAs have been induced.
#>   X1 X2 X3 X4 X5
#> 1  1 NA  1  1  1
#> 2 NA NA  0 NA  2
#> 3  0 NA  0  2  3
asNumericIfPossible(dat, transform.factors=TRUE,
                      maintain.factor.scores=TRUE)
#> Warning: 'X2' has been coerced to numeric, NAs have been induced.
#> Warning: 'X4' has been coerced to numeric, NAs have been induced.
#>   X1 X2 X3 X4 X5
#> 1  1 NA  1 NA  5
#> 2 NA NA  0 NA  6
#> 3  0 NA  0 NA  7
```
