# Removes all non-numeric characters from a string.

Function removes all non-numeric characters from a string.

## Usage

``` r
removeNonNumeric ( string)
```

## Arguments

- string:

  a character vector

## Value

a character string

## Author

Sebastian Weirich

## Examples

``` r
str <- c(".d1.nh.120", "empty", "110", ".nh.dgd", "only.nh")
removeNonNumeric(str)
#> [1] "1120" ""     "110"  ""     ""    
```
