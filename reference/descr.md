# Descriptive statistics for one or several variables

Function computes descriptive statistics for one variable or several
variables within a data frame.

## Usage

``` r
descr (variable, na = NA, p.weights = NULL, na.rm = FALSE, verbose=TRUE)
```

## Arguments

- variable:

  one variable or a data.frame with several variables

- na:

  optional values with should be considered a missing values

- p.weights:

  optional: vector with individual weights if weighted statistics should
  be computed

- na.rm:

  logical: should missings be removed prior to estimation?

- verbose:

  logical: Print messages to console?

## Value

a data frame with the following columns

- N:

  number of observations

- N.valid:

  number of non-missing observations

- Missing:

  number of missings

- Minimum:

  minimum of numeric variables

- Maximum:

  maximum of numeric variables

- Sum:

  sum of numeric variables

- Mean:

  arithmetic mean of numeric variables

- std.err:

  standard error of the arithmetic mean. Note: for weighted means,
  standard error is estimated according to Cochran (1977):
  \\sigma_x^2=n/((n-1)\*w_s^2)\*Sigma(w_i^2\*(x_i-x))\\.

- sig:

  p value

- Median:

  median of numeric variables

- SD:

  standard deviation of numeric variables

- Var:

  variance of numeric variables

## References

Cochran W. G. (1977). *Sampling Techniques* (3rd Edn). Wiley, New York

## Author

Sebastian Weirich

## Examples

``` r
data(mtcars)
descr(mtcars)
#>       N N.valid Missing Minimum Maximum      Sum       Mean     std.err
#> mpg  32      32       0  10.400  33.900  642.900  20.090625  1.06542396
#> cyl  32      32       0   4.000   8.000  198.000   6.187500  0.31570933
#> disp 32      32       0  71.100 472.000 7383.100 230.721875 21.90947271
#> hp   32      32       0  52.000 335.000 4694.000 146.687500 12.12031731
#> drat 32      32       0   2.760   4.930  115.090   3.596563  0.09451874
#> wt   32      32       0   1.513   5.424  102.952   3.217250  0.17296847
#> qsec 32      32       0  14.500  22.900  571.160  17.848750  0.31588992
#> vs   32      32       0   0.000   1.000   14.000   0.437500  0.08909831
#> am   32      32       0   0.000   1.000   13.000   0.406250  0.08820997
#> gear 32      32       0   3.000   5.000  118.000   3.687500  0.13042656
#> carb 32      32       0   1.000   8.000   90.000   2.812500  0.28552971
#>               sig  Median          SD          Var
#> mpg  1.526151e-18  19.200   6.0269481 3.632410e+01
#> cyl  5.048147e-19   6.000   1.7859216 3.189516e+00
#> disp 9.189065e-12 196.300 123.9386938 1.536080e+04
#> hp   2.794134e-13 123.000  68.5628685 4.700867e+03
#> drat 1.377586e-27   3.695   0.5346787 2.858814e-01
#> wt   2.257406e-18   3.325   0.9784574 9.573790e-01
#> qsec 7.790282e-33  17.710   1.7869432 3.193166e+00
#> vs   2.776961e-05   0.000   0.5040161 2.540323e-01
#> am   6.632258e-05   0.000   0.4989909 2.489919e-01
#> gear 1.066949e-23   4.000   0.7378041 5.443548e-01
#> carb 4.590930e-11   2.000   1.6152000 2.608871e+00
```
