# Use `asNumericIfPossible` with modified warning.

This function uses `asNumericIfPossible` but lets the user change the
warning issued by `asNumericIfPossible`. Suited for use in other `R`
packages.

## Usage

``` r
catch_asNumericIfPossible(x, warn, maintain.factor.scores = TRUE,
force.string = TRUE, transform.factors = TRUE)
```

## Arguments

- x:

  A vector or data frame which should be converted.

- warn:

  A character vector of length 1 with the desired warning.

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

## Details

For details see
[`asNumericIfPossible`](https://weirichs.github.io/eatTools/reference/asNumericIfPossible.md)

## Author

Benjamin Becker

## Examples

``` r
char <- c("a", "b", 1)
catch_asNumericIfPossible(x = char, warn = "Vector could not be converted")
#> Warning: Vector could not be converted
#> [1] NA NA  1
```
