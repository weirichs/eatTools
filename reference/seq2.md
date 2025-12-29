# Sequence generation

Creates a sequence of integers. Modified version of `seq` returning an
empty vector if the starting point is larger than the end point.
Originally provided by
[`rlang::seq2()`](https://rlang.r-lib.org/reference/seq2.html).

## Usage

``` r
seq2(from, to)
```

## Arguments

- from:

  The starting value of the sequence. Of length 1.

- to:

  The end value of the sequence. Of length 1.

## Value

A numerical sequence

## Examples

``` r
seq2(from = 1, to = 5)
#> [1] 1 2 3 4 5
```
