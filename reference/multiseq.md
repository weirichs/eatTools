# multiple sequences

creates a sequence for every unique value in a vector

## Usage

``` r
multiseq(v)
```

## Arguments

- v:

  a vector

## Value

a vector with multiple sequences

## Author

Martin Hecht

## Examples

``` r
v <- c("a", "a", "a", "c", "b", "b" , "a")
multiseq(v)
#> [1] 1 2 3 1 1 2 4
```
