# Creates skeleton for frequency tables with desired values

Function takes values and creates a frequency table including these
values. Models behavior of factor variables.

## Usage

``` r
tablePattern (x, pattern = NULL, weights, na.rm = TRUE,
useNA = c("no", "ifany", "always"))
```

## Arguments

- x:

  a vector

- pattern:

  desired values for table output

- weights:

  optional: weights

- na.rm:

  should missing values be removed

- useNA:

  whether to include \[NA\] values in the table

## Value

a frequency table

## Author

Sebastian Weirich

## Examples

``` r
grades <- c(1,1,3,4,2,3,4,5,5,3,2,1)
table(grades)
#> grades
#> 1 2 3 4 5 
#> 3 2 3 2 2 
tablePattern(grades, pattern = 1:6)
#> y
#> 1 2 3 4 5 6 
#> 3 2 3 2 2 0 
```
