# Remove Trailing and Leading Characters From Character Strings

Similarly to the function `trim` from the `gdata` package, this function
can be used to remove trailing and leading spaces from character
strings. However, in contrast to `trim`, any character can be removed by
`crop`.

## Usage

``` r
crop(x, char = " ")
```

## Arguments

- x:

  character string

- char:

  character to be removed from beginning and end of `x`

## Author

Martin Hecht, Sebastian Weirich

## Examples

``` r
str <- c(" 12  kk ", "op j    q ", "110")
crop(str)
#> [1] "12  kk"    "op j    q" "110"      
crop(str, "op")
#> [1] " 12  kk " " j    q " "110"     
```
