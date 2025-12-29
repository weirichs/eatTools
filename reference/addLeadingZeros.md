# Add leading zeros to all columns that can be identified as integers in a character data.frame

Adds leading zeros to all columns that can be identified as integers in
a data.frame that consists of character columns only.

## Usage

``` r
addLeadingZerosToCharInt(dat)
```

## Arguments

- dat:

  a data.frame consisting of character columns only

## Value

a data.frame of only character columns and the same dimensions as the
input data.frame. In any column containing strings that can be converted
to integers, these strings will be padded with leading zeros so that all
values in the column have the same number of digits.

## Author

Karoline Sachse

## Examples

``` r
dat <- data.frame(v1 = c("0","300","e",NA),
                  v2=c("0","90","10000",NA),
                  v3=c("k","kk","kkk",NA),
                  v4=NA,
                  v5=c("0","90","100","1"))
dat <- set.col.type(dat)
addLeadingZerosToCharInt(dat)
#>     v1    v2   v3   v4  v5
#> 1    0 00000    k <NA> 000
#> 2  300 00090   kk <NA> 090
#> 3    e 10000  kkk <NA> 100
#> 4 <NA>  <NA> <NA> <NA> 001
```
