
removeNonNumeric <- function ( string ) {gsub("[^0-9]","",string)}

### entfernt bestimmtes Pattern aus einem String
removePattern     <- function ( string, pattern ) {
  checkmate::assert_character(string)
  checkmate::assert_character(pattern, len = 1)
  splitt <- strsplit(string, pattern)
  ret    <- unlist(lapply(splitt, FUN = function ( y ) { paste(y, collapse="")}))
  return(ret)}

removeNumeric <- function ( string ) {
  checkmate::assert_character(string)
  gsub("0|1|2|3|4|5|6|7|8|9","",string)}

crop <- function ( x , char = " " ) {
  checkmate::assert_character(x)
  checkmate::assert_vector(char, len = 1, strict = TRUE)
  if ( char %in% c ( "\\" , "+" , "*" , "." , "(" , ")" , "[" , "]" , "{" , "}" , "|" , "^" , "$" ) ) {char <- paste ( "\\" , char , sep = "" ) }
  gsub ( paste ( "^" , char , "+|" , char , "+$" , sep = "" ) , "" , x ) }


### gsub for more than one pattern
gsubAll <- function(string, old, new) {
  checkmate::assert_character(string)
  lapply(list(old, new), FUN = checkmate::assert_character,unique=TRUE, any.missing = FALSE, min.len = 2)
  stopifnot ( length(old) == length(new))
  stopifnot (length(intersect(old, new))==0)                                    ### in einem Zwischenschritt unique IDs mit gleich vielen characters erzeugen
  inter <- stringi::stri_rand_strings(n=length(old), length=12, pattern="[A-Za-z0-9]")
  stopifnot(length(unique(inter)) == length(inter))
  ind <- sort(nchar(old), decreasing = TRUE, index.return=TRUE)                 ### sortieren nach nchar(), wenn kuerzere strings in laengeren enthalten
  old <- old[ind[["ix"]]]
  new <- new[ind[["ix"]]]
  for(i in seq_along(old)) {
    string <- gsub(old[i], inter[i], string, fixed = TRUE)
  }
  for(i in seq_along(old)) {
    string <- gsub(inter[i], new[i], string, fixed = TRUE)
  }
  return(string)}


### splits the string only on the first or the last occurrence of the separator
halveString <- function (string, pattern, first = TRUE, colnames=c("X1", "X2") )  {
  checkmate::assert_character(string)
  checkmate::assert_character(pattern, len = 1)
  checkmate::assert_character(colnames, len = 2, unique = TRUE)
  if(!any(grepl(pattern, string))) {
     warning(paste0("Pattern '",pattern,"' does not occur in in the string."))
     ret <- matrix(data = NA, nrow = length(string), ncol = 2,dimnames=list(NULL, colnames))
     ret[,1] <- string
     return(ret)
  }
  if(!first) {
     ret <- rbind_fill_vector(regmatches(stringi::stri_reverse(string), regexpr(pattern, stringi::stri_reverse(string)), invert = TRUE))
     for ( i in 1:ncol(ret)) {ret[,i] <- stringi::stri_reverse(ret[,i])}
     na  <- which(apply(ret, MARGIN = 1, FUN = function(y) {any(is.na(y))}))    ### reverse muss wieder rueckgaengig gemacht werden, ausser fuer die NAs
     ret <- ret[,c(2,1), drop=FALSE]                                            ### die sollen an der Stelle bleiben, wo sie sind
     if(length(na)>0) {ret[na,] <- ret[na,c(2,1)]}                              ### falls es welche gibt, muss das rueckgaengig wieder rueckgaengig gemacht werden
  } else {
     ret <- rbind_fill_vector(regmatches(string, regexpr(pattern, string), invert = TRUE))
  }
  ret[ret==""] <- NA                                                            ### keine leeren Strings, sondern NAs
  colnames(ret) <- colnames
  return(ret)}



