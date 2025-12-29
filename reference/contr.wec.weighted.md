# Calculates contrasts for a weighted factor variable based on weighted effect coding

Function works equivalent to `contr.wec` from the `wec` package, but
allows for weighted contrasts.

## Usage

``` r
contr.wec.weighted (x, omitted, weights)
```

## Arguments

- x:

  grouping variable of class factor

- omitted:

  Label of the factor label that should be taken as the omitted category

- weights:

  Numeric vector of non-negative weights

## Value

Returns a contrast matrix based on weighted effect coding.

## Author

Sebastian Weirich, based upon the `contr.wec` function of the `wec`
package

## Examples

``` r
### exemplary data according to wec paper
dat <- data.frame ( group = as.factor(c(rep(1,3), rep(2,2))), wgt = c(2/3, 4/3, 2, 3/8, 5/8))
### default contrasts
contrasts(dat[,"group"])
#>   2
#> 1 0
#> 2 1
### weighted effect coding for weighted data
contr.wec.weighted(x= dat[,"group"], omitted=1,weights=dat[,"wgt"])
#>       2
#> 1 -0.25
#> 2  1.00
### equal to weighted effect coding: wec::contr.wec(x= dat[,"group"], omitted=1)
contr.wec.weighted(x= dat[,"group"], omitted=1,weights=rep(1, nrow(dat)))
#>            2
#> 1 -0.6666667
#> 2  1.0000000
```
