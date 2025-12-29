# Changelog

## eatTools 0.7.9

CRAN release: 2025-09-12

- new exemplary dataset `data.timss1` borrowed from the BIFIEsurvey
  package for illustration purposes of the
  [`checkBackgroundVariables()`](https://weirichs.github.io/eatTools/reference/checkBackgroundVariables.md)
  function
- new function
  [`checkBackgroundVariables()`](https://weirichs.github.io/eatTools/reference/checkBackgroundVariables.md)
  checks the consistency of the variables in a data set if the variables
  belong to different groups, which in turn have different properties,
  for example ID variables, weighting variables, replication weights or
  covariates.
- [`existsBackgroundVariables()`](https://weirichs.github.io/eatTools/reference/existsBackgroundVariables.md)
  now allows to check the number of variables entered if, for example,
  several items but only one ID may be defined for a data record. It
  also checks which variable groups may overlap and which may not.

## eatTools 0.7.8

CRAN release: 2024-12-18

- new function
  [`cleanifyString()`](https://weirichs.github.io/eatTools/reference/cleanifyString.md)
  removes non-alphanumeric characters and special characters from a
  string or factor variable

## eatTools 0.7.7

CRAN release: 2024-10-11

- minor bugfixes when integers are very large in
  [`addLeadingZerosToCharInt()`](https://weirichs.github.io/eatTools/reference/addLeadingZeros.md)
  (Previously an error message was displayed.)
- minor bugfixes in the messages of
  [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
- [`recodeLookup()`](https://weirichs.github.io/eatTools/reference/recodeLookup.md)
  return the original vector if the the user does not provide any recode
  table (i.e., if the argument is NULL). (Previously an error message
  was displayed.)
- minor bugfixes in the display of
  [`makeTria()`](https://weirichs.github.io/eatTools/reference/makeTria.md)
- messages can be turned off in
  [`makeDataFrame()`](https://weirichs.github.io/eatTools/reference/makeDataFrame.md)
- package sticker added
- bugfixes in
  [`gsubAll()`](https://weirichs.github.io/eatTools/reference/gsubAll.md):
  Does not longer allow using regular expressions (internally,
  `gsub(..., fixed = TRUE)` is used). Function now begins with the
  longest string to avoid repeated modifications if strings in “old”
  match each other. See function documentation for further details.

## eatTools 0.7.6

CRAN release: 2024-04-05

- add argument checks using the checkmate package
- bugfix in
  [`halveString()`](https://weirichs.github.io/eatTools/reference/halveString.md)
  for splitting at the last instance of a regular expression
- new function
  [`rbind_fill_vector()`](https://weirichs.github.io/eatTools/reference/rbind_fill_vector.md)
  allows [`rbind()`](https://rdrr.io/r/base/cbind.html) for
  unidimensional vectors of unequal length, filling empty entries with
  NA
- new operator `%$$%` works for lists similar to `$` but gives error
  instead of NULL if the corresponding list element does not exist

## eatTools 0.7.5

CRAN release: 2023-11-23

- internal fixes to tests (removed language dependency)
- new function
  [`makeTria()`](https://weirichs.github.io/eatTools/reference/makeTria.md)
  for internal use in `eatTools` and `eatModel` reshapes
  covariance/correlation matrices into triangular shape
- added
  [`seq2()`](https://weirichs.github.io/eatTools/reference/seq2.md) for
  sequence generation
- adapt
  [`halveString()`](https://weirichs.github.io/eatTools/reference/halveString.md)
  for patterns with more than 1 character
- add messages to
  [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
  if combinations of merge variables from one data set do not occur in
  the other data set
- add messages to
  [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
  if the two `data.frames` intended to merge contain additional common
  variables (beyond the `by`-variables)
- [`makeDataFrame()`](https://weirichs.github.io/eatTools/reference/makeDataFrame.md)
  gives warning/errors if data.frame has less rows than expected at the
  least.
- [`existsBackgroundVariables()`](https://weirichs.github.io/eatTools/reference/existsBackgroundVariables.md)
  gives warning/errors if variables have missing values, depending on
  how critical the missing values are considered to be

## eatTools 0.7.4

CRAN release: 2022-11-10

- new function
  [`rbind_common()`](https://weirichs.github.io/eatTools/reference/rbind_common.md)
  rbinds a list of data.frames and selects only common columns
- bug fix in
  [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
  when variables have more than one class
- [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
  gives warning if merging variables have NAs
- optional colnames argument in
  [`halveString()`](https://weirichs.github.io/eatTools/reference/halveString.md)
  function

## eatTools 0.7.3

CRAN release: 2022-06-28

- new function
  [`print_and_capture()`](https://weirichs.github.io/eatTools/reference/print_and_capture.md)
  mainly for internal use in `eatRep` and `eatCodebook` packages allows
  for easy integration of (small) tables into (error) messages
- added some unit tests

## eatTools 0.7.2

CRAN release: 2022-05-05

- new function
  [`makeDataFrame()`](https://weirichs.github.io/eatTools/reference/makeDataFrame.md)
  for internal use in `eatRep` and `eatModel` packages converts
  `tibbles` and `data.tables` to data.frame
- new function
  [`mergeAttr()`](https://weirichs.github.io/eatTools/reference/mergeAttr.md)
  mainly for internal use in `eatRep` and `eatModel` packages restores
  attributes after merging and provides messages if merging units are
  not unique or only partially matches
- new function
  [`pwc()`](https://weirichs.github.io/eatTools/reference/pwc.md)
  computes part-whole-correlation between an item and the whole scale
  (except this item)

## eatTools 0.7.1

CRAN release: 2021-11-10

- new function
  [`roundDF()`](https://weirichs.github.io/eatTools/reference/roundDF.md)
  rounds all numeric variables in a `data.frame`

## eatTools 0.7.0

CRAN release: 2021-08-11

- new function
  [`na_omit_selection()`](https://weirichs.github.io/eatTools/reference/na_omit_selection.md)
  drops rows containing missing values in selected columns
- [`existsBackgroundVariables()`](https://weirichs.github.io/eatTools/reference/existsBackgroundVariables.md):
  add optional warning if variables contains missing values

## eatTools 0.6.0

CRAN release: 2021-07-06

- new function
  [`readMultisep()`](https://weirichs.github.io/eatTools/reference/readMultisep.md)
  reads in data.frames with separator characters \>=1Byte
- new function
  [`addLeadingZerosToCharInt()`](https://weirichs.github.io/eatTools/reference/addLeadingZeros.md)
  adds leading zeros to all columns that can be identified as integers
  in a character data.frame
- bug fix in
  [`descr()`](https://weirichs.github.io/eatTools/reference/descr.md).
  missing handling in variable when additional weights are used  
- bug fix in
  [`tablePattern()`](https://weirichs.github.io/eatTools/reference/tablePattern.md)
  when additional weights are used

## eatTools 0.5.0

CRAN release: 2021-02-09

- new function
  [`recodeLookup()`](https://weirichs.github.io/eatTools/reference/recodeLookup.md)
  allows recoding of a variable based on a look up table
- functionality of
  [`wideToLong()`](https://weirichs.github.io/eatTools/reference/wideToLong.md)
  extended
- Switch to Github Action for CI

## eatTools 0.4.0

CRAN release: 2021-01-25

- new function
  [`do_call_rbind_withName()`](https://weirichs.github.io/eatTools/reference/do_call_rbind_withName.md)
  allows row binding a list of `data.frames` while keeping their list
  names
- bug fix in
  [`wideToLong()`](https://weirichs.github.io/eatTools/reference/wideToLong.md)

## eatTools 0.3.8

CRAN release: 2020-10-19

- [`asNumericIfPossible()`](https://weirichs.github.io/eatTools/reference/asNumericIfPossible.md)
  now works with matrices

## eatTools 0.3.6

CRAN release: 2020-09-17

- Initial CRAN release
