removeUmlaut <- function(var) {
  stopifnot(inherits(var, c("character", "factor")))
  old <- list(var = as.character(var), lev = levels(var))
  new <- lapply(old, FUN = function (x) {gsub("[^[:alnum:]]", "", x) |> stringi::stri_trans_general(id = "de-ASCII; Latin-ASCII") |> iconv(from="latin1", to="UTF-8")})
  if(inherits(var, "factor")) {
     varNew <- factor(x = new[[1]], levels = new[[2]])
  } else {
     varNew <- new[[1]]
  }
  return(varNew)}


