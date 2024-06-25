# eatTools 0.7.6

* add argument checks using the checkmate package
* bugfix in `halveString()` for splitting at the last instance of a regular expression
* new function `rbind_fill_vector()` allows `rbind()` for unidimensional vectors of unequal length, filling empty entries with NA
* new operator `%$$%` works for lists similar to `$` but gives error instead of NULL if the corresponding list element does not exist

# eatTools 0.7.5

* internal fixes to tests (removed language dependency)
* new function `makeTria()` for internal use in `eatTools` and `eatModel` reshapes covariance/correlation matrices into triangular shape
* added `seq2()` for sequence generation
* adapt `halveString()` for patterns with more than 1 character
* add messages to `mergeAttr()` if combinations of merge variables from one data set do not occur in the other data set
* add messages to `mergeAttr()` if the two `data.frames` intended to merge contain additional common variables (beyond the `by`-variables)
* `makeDataFrame()` gives warning/errors if data.frame has less rows than expected at the least.
* `existsBackgroundVariables()` gives warning/errors if variables have missing values, depending on how critical the missing values are considered to be

# eatTools 0.7.4

* new function `rbind_common()` rbinds a list of data.frames and selects only common columns
* bug fix in `mergeAttr()` when variables have more than one class
* `mergeAttr()` gives warning if merging variables have NAs
* optional colnames argument in `halveString()` function 

# eatTools 0.7.3

* new function `print_and_capture()` mainly for internal use in `eatRep` and `eatCodebook` packages allows for easy integration of (small) tables into (error) messages
* added some unit tests

# eatTools 0.7.2

* new function `makeDataFrame()` for internal use in `eatRep` and `eatModel` packages converts `tibbles` and `data.tables` to data.frame
* new function `mergeAttr()` mainly for internal use in `eatRep` and `eatModel` packages restores attributes after merging and provides messages if merging units are not unique or only partially matches
* new function `pwc()` computes part-whole-correlation between an item and the whole scale (except this item)

# eatTools 0.7.1

* new function `roundDF()` rounds all numeric variables in a `data.frame`

# eatTools 0.7.0

* new function `na_omit_selection()` drops rows containing missing values in selected columns
* `existsBackgroundVariables()`: add optional warning if variables contains missing values

# eatTools 0.6.0

* new function `readMultisep()` reads in data.frames with separator characters >=1Byte
* new function `addLeadingZerosToCharInt()` adds leading zeros to all columns that can be identified as integers in a character data.frame
* bug fix in `descr()`. missing handling in variable when additional weights are used  
* bug fix in `tablePattern()` when additional weights are used

# eatTools 0.5.0

* new function `recodeLookup()` allows recoding of a variable based on a look up table
* functionality of `wideToLong()` extended
* Switch to Github Action for CI

# eatTools 0.4.0

* new function `do_call_rbind_withName()` allows row binding a list of `data.frames` while keeping their list names 
* bug fix in `wideToLong()`

# eatTools 0.3.8

* `asNumericIfPossible()` now works with matrices

# eatTools 0.3.6

* Initial CRAN release
