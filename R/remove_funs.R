
removeNonNumeric <- function ( string ) {gsub("[^0-9]","",string)}

### entfernt bestimmtes Pattern aus einem String
removePattern     <- function ( string, pattern ) {
  splitt <- strsplit(string, pattern)
  ret    <- unlist(lapply(splitt, FUN = function ( y ) { paste(y, collapse="")}))
  return(ret)}

removeNumeric <- function ( string ) {gsub("0|1|2|3|4|5|6|7|8|9","",string)}

crop <- function ( x , char = " " ) {
  if ( char %in% c ( "\\" , "+" , "*" , "." , "(" , ")" , "[" , "]" , "{" , "}" , "|" , "^" , "$" ) ) {char <- paste ( "\\" , char , sep = "" ) }
  gsub ( paste ( "^" , char , "+|" , char , "+$" , sep = "" ) , "" , x ) }


### gsub for more than one pattern
gsubAll <- function(string, old, new) {
  stopifnot ( is.character(string), is.character(old), is.character(new), length(old) == length(new))
  for(i in seq_along(old)) {
    string <- gsub(old[i], new[i], string)
  }
  return(string)
}


### splits the string only on the first or the last occurrence of the separator
halveString <- function (string, pattern, first = TRUE, colnames=c("X1", "X2") )  {
  if( !(inherits(colnames, "character") && length(colnames)==2 && length(unique(colnames)) == 2 )) {stop("'colnames' must be a unique character vector of length 2.")}
  if(!first) {
     front<- sub(paste0(pattern, "[^",pattern,"]+$"), "", string)
     back <- sub(paste0(".*",pattern,"|^[^",pattern,"]*$"), "", string)
     back[back==""] <- NA
     ret <- matrix(c(front, back), ncol=2, dimnames=list(NULL, colnames))
  }
  if(first) {
     ret <- rbind_fill_vector(regmatches(string, regexpr(pattern, string), invert = TRUE))
     colnames(ret) <- colnames
  }
  return(ret)}

