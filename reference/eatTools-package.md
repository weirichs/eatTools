# eatTools: Miscellaneous Functions for the Analysis of Educational Assessments

The `eatTools` package provides various groups of functions. The main
groups of functions include: transformation of vector types,
modification of character variables, descriptive analyses and weighted
statistics. The package's purpose is mainly to function as a lightweight
dependency for other packages.

## Transformation of vector types

The functions
[`asNumericIfPossible`](https://weirichs.github.io/eatTools/reference/asNumericIfPossible.md)
and
[`catch_asNumericIfPossible`](https://weirichs.github.io/eatTools/reference/catch_asNumericIfPossible.md)
transform character and factor variables to numeric.
[`facToChar`](https://weirichs.github.io/eatTools/reference/facToChar.md)
transforms factor variables to character.
[`set.col.type`](https://weirichs.github.io/eatTools/reference/set.col.type.md)
allows manually setting the type of multiple variables within a
`data.frame`.

## Modification of character variables

Multiple convenience functions exist for modification of character
variables: removing certain pattern
([`removePattern`](https://weirichs.github.io/eatTools/reference/removePattern.md)),
removing numerics
([`removeNumeric`](https://weirichs.github.io/eatTools/reference/removeNumeric.md))
and removing non numerics
([`removeNonNumeric`](https://weirichs.github.io/eatTools/reference/removeNonNumeric.md)),
substituting multiple patterns within a string
([`gsubAll`](https://weirichs.github.io/eatTools/reference/gsubAll.md))
and splitting strings into multiple or a fixed number of parts but at
specific position
([`halveString`](https://weirichs.github.io/eatTools/reference/halveString.md))

## Descriptive Statistics

The function
[`descr`](https://weirichs.github.io/eatTools/reference/descr.md)
provides simple descriptive statistics for a `data.frame`, but in a
format especially useful for further automated processing (long format
`data.frame`).

## Weighted Statistics

[`wtdVar`](https://weirichs.github.io/eatTools/reference/wtdVar.md)
provides calculation of weighted variances (this can be done also by the
package `Hmisc`, which has, however, a very high number of
dependencies).
[`wtdTable`](https://weirichs.github.io/eatTools/reference/wtdTable.md)
provides a weighted frequency table.
