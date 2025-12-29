# Transform columns in a data frame

Function transforms all data frame columns of a specific class into
another class.

## Usage

``` r
facToChar ( dataFrame, from = "factor", to = "character")
```

## Arguments

- dataFrame:

  a data frame

- from:

  which column class should be transformed?

- to:

  target column class

## Value

a data frame

## Author

Sebastian Weirich

## Examples

``` r
data(mtcars)
### original classes
sapply(mtcars, class)
#>       mpg       cyl      disp        hp      drat        wt      qsec        vs 
#> "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" 
#>        am      gear      carb 
#> "numeric" "numeric" "numeric" 
mtcars1 <- facToChar(mtcars, from = "numeric", to = "character")
sapply(mtcars1, class)
#>         mpg         cyl        disp          hp        drat          wt 
#> "character" "character" "character" "character" "character" "character" 
#>        qsec          vs          am        gear        carb 
#> "character" "character" "character" "character" "character" 
```
