# Round a `data.frame`.

Round all numeric variables in a `data.frame`, leave the other variables
untouched. Column and row names are preserved.

## Usage

``` r
roundDF(dat, digits = 3)
```

## Arguments

- dat:

  A `data.frame`.

- digits:

  Integer indicating the number of decimal places.

## Value

Returns the rounded `data.frame`.

## Examples

``` r
roundDF(mtcars, digits = 0)
#>                     mpg cyl disp  hp drat wt qsec vs am gear carb
#> Mazda RX4            21   6  160 110    4  3   16  0  1    4    4
#> Mazda RX4 Wag        21   6  160 110    4  3   17  0  1    4    4
#> Datsun 710           23   4  108  93    4  2   19  1  1    4    1
#> Hornet 4 Drive       21   6  258 110    3  3   19  1  0    3    1
#> Hornet Sportabout    19   8  360 175    3  3   17  0  0    3    2
#> Valiant              18   6  225 105    3  3   20  1  0    3    1
#> Duster 360           14   8  360 245    3  4   16  0  0    3    4
#> Merc 240D            24   4  147  62    4  3   20  1  0    4    2
#> Merc 230             23   4  141  95    4  3   23  1  0    4    2
#> Merc 280             19   6  168 123    4  3   18  1  0    4    4
#> Merc 280C            18   6  168 123    4  3   19  1  0    4    4
#> Merc 450SE           16   8  276 180    3  4   17  0  0    3    3
#> Merc 450SL           17   8  276 180    3  4   18  0  0    3    3
#> Merc 450SLC          15   8  276 180    3  4   18  0  0    3    3
#> Cadillac Fleetwood   10   8  472 205    3  5   18  0  0    3    4
#> Lincoln Continental  10   8  460 215    3  5   18  0  0    3    4
#> Chrysler Imperial    15   8  440 230    3  5   17  0  0    3    4
#> Fiat 128             32   4   79  66    4  2   19  1  1    4    1
#> Honda Civic          30   4   76  52    5  2   19  1  1    4    2
#> Toyota Corolla       34   4   71  65    4  2   20  1  1    4    1
#> Toyota Corona        22   4  120  97    4  2   20  1  0    3    1
#> Dodge Challenger     16   8  318 150    3  4   17  0  0    3    2
#> AMC Javelin          15   8  304 150    3  3   17  0  0    3    2
#> Camaro Z28           13   8  350 245    4  4   15  0  0    3    4
#> Pontiac Firebird     19   8  400 175    3  4   17  0  0    3    2
#> Fiat X1-9            27   4   79  66    4  2   19  1  1    4    1
#> Porsche 914-2        26   4  120  91    4  2   17  0  1    5    2
#> Lotus Europa         30   4   95 113    4  2   17  1  1    5    2
#> Ford Pantera L       16   8  351 264    4  3   14  0  1    5    4
#> Ferrari Dino         20   6  145 175    4  3   16  0  1    5    6
#> Maserati Bora        15   8  301 335    4  4   15  0  1    5    8
#> Volvo 142E           21   4  121 109    4  3   19  1  1    4    2
```
