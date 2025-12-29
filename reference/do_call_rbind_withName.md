# Row bind a list while assigning names to rows

Use `do.call(rbind, ...)` on a list of `data.frames` while creating a
new variable (`colName`) which contains, for example, the original list
naming (`name`).

## Usage

``` r
do_call_rbind_withName(df_list, name = names(df_list), colName)
```

## Arguments

- df_list:

  A list of `data.frames`.

- name:

  Vector of names to fill `colName`. Default uses the names of
  `df_list`.

- colName:

  A single character; name for the new column.

## Value

Returns a `data.frame`.

## Author

Benjamin Becker

## Examples

``` r
### create example list
df_list <- lapply(mtcars, function(x) {
  data.frame(m = mean(x), sd = sd(x))
})

### transform to a single data.frame
do_call_rbind_withName(df_list, colName = "variable")
#>    variable          m          sd
#> 1       mpg  20.090625   6.0269481
#> 2       cyl   6.187500   1.7859216
#> 3      disp 230.721875 123.9386938
#> 4        hp 146.687500  68.5628685
#> 5      drat   3.596563   0.5346787
#> 6        wt   3.217250   0.9784574
#> 7      qsec  17.848750   1.7869432
#> 8        vs   0.437500   0.5040161
#> 9        am   0.406250   0.4989909
#> 10     gear   3.687500   0.7378041
#> 11     carb   2.812500   1.6152000
```
