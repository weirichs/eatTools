# Read in data.frames with separator characters \>=1Byte

Read in character separated data.frames with separator characters
\>=1Byte.

## Usage

``` r
readMultisep(file, sep, colnames=TRUE)
```

## Arguments

- file:

  the name of the file which the data are to be read from.

- sep:

  the field separator character(s).

- colnames:

  logical. Whether first line in file contains colnames.

## Value

A data frame containing a representation of the data in the file.

## Examples

``` r
filePath <- tempfile(fileext = ".txt")
dat <- data.frame(v1 = c("0","300","e",NA),
                  v2=c("0","90","10000",NA),
                  v3=c("k","kk","kkk",NA),
                  v4=NA,
                  v5=c("0","90","100","1"))
write.table(dat, file = filePath, row.names = FALSE, col.names = FALSE, sep = "]&;")
readMultisep(filePath, sep="]&;")
#>     X0  X0.1    k NA. X0.2
#> 1  300    90   kk  NA   90
#> 2    e 10000  kkk  NA  100
#> 3 <NA>    NA <NA>  NA    1
```
