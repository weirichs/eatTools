# Extract Parts of an Object (list)

`%$$%` is an operator that is mainly used internally in the eatRep and
eatModel packages. `%$$%` is similar to `$`, but gives error instead of
`NULL` if the corresponding element does not exists.

## Usage

``` r
x %$$% y
```

## Arguments

- x:

  a list

- y:

  name of the corresponding element of `x`

## Value

the selected element of the list `x`

## Examples

``` r
if (FALSE) { # \dontrun{
x <- list(value1 = 14, value2 = NULL)
x$value2                 # NULL
x$value_not_defined      # NULL
x%$$%value2            # NULL
x%$$%value_not_defined # error
} # }
```
