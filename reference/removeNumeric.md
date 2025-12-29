# Removes alphanumeric characters from a string.

Function removes alphanumeric characters from a string.

## Usage

``` r
removeNumeric ( string)
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
removeNumeric(str)
#> [1] ".d.nh."  "empty"   ""        ".nh.dgd" "only.nh"
```
