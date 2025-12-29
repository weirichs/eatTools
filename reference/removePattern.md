# Removes a specified pattern from a string.

Function remove a specified string from a character vector.

## Usage

``` r
removePattern ( string, pattern)
```

## Arguments

- string:

  a character vector

- pattern:

  a character pattern of length 1

## Value

a character string

## Examples

``` r
str <- c(".d1.nh.120", "empty", "110", ".nh.dgd", "only.nh")
removePattern(str, ".nh.")
#> [1] ".d1120"  "empty"   "110"     "dgd"     "only.nh"
```
