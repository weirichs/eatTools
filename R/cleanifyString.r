cleanifyString <- function(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
                           oldEncoding = NULL, ...) {
  lapply(c(removeNonAlphaNum, replaceSpecialChars), checkmate::assert_logical, len = 1)
  checkmate::assert_character(oldEncoding, len = 1, null.ok = TRUE)
  UseMethod("cleanifyString")
  }

### ----------------------------------------------------------------------------

cleanifyString.character <- function(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
                                     oldEncoding = NULL, ...) {
  if(!is.null(oldEncoding)) {
    x <- iconv(x, from=oldEncoding, to="UTF-8")
  }
  if(removeNonAlphaNum) {
    x <- gsub("[^[:alnum:]]", "", x)
  }
  if(replaceSpecialChars) {
    x <- stringi::stri_trans_general(x, id = "de-ASCII; Latin-ASCII")
  }

  return(x)}

### ----------------------------------------------------------------------------

cleanifyString.factor <- function(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
                                  oldEncoding = NULL, ...) {
  old <- list(var = as.character(x), lev = levels(x))
  new <- lapply(old, cleanifyString,
                removeNonAlphaNum = removeNonAlphaNum, replaceSpecialChars = replaceSpecialChars,
                oldEncoding = oldEncoding, ...)

  #browser()
  varNew <- factor(x = new[[1]], levels = unique(new[[2]]))

  return(varNew)}

### ----------------------------------------------------------------------------

cleanifyString.data.frame <- function(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
                                      oldEncoding = NULL, ...) {
  for(i in 1:ncol(x)) {
    input_vec <- x[,i]
    if(is.character(input_vec) | is.factor(input_vec)) {
      x[,i] <- cleanifyString(input_vec, removeNonAlphaNum = removeNonAlphaNum,
                              replaceSpecialChars = replaceSpecialChars, oldEncoding = oldEncoding, ...)
    }
  }
  return(x)}
