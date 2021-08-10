# eatTools 0.7.0

* new function `na_omit_selection()` drops rows containing missing values in selected columns
* existsBackgroundVariables: add optional warning if variables contains missing values

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
