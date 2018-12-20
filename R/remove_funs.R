
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
### uses no longer package "stringr"
halveString <- function (string, pattern, first = TRUE )  {
  allSplit<- strsplit(x = string, split = pattern)
  if(first==TRUE)  {
    ret <- as.matrix(data.frame(X1 = unlist(lapply(allSplit, FUN = function (l) { l[1]})),
                                X2 = unlist(lapply(1:length(allSplit), FUN = function (l) {
                                  if(length(allSplit[[l]]) == 1 )  { ret <- NA } else { ret <- substring(string[l], first = nchar(allSplit[[l]][1])+2 ) }
                                  return(ret)})), stringsAsFactors = FALSE))
  }  else  {
    ret <- as.matrix(data.frame(X1 = unlist(lapply(1:length(allSplit), FUN = function (l) {
                                     if (length(allSplit[[l]]) > 1 ) {
                                         val <- substr(string[l],1,nchar(string[l])-(nchar(allSplit[[l]][length(allSplit[[l]])])+1))
                                     }  else  {
                                         val <- string[l]
                                     }
                                     return(val)})),
                                X2 = unlist(lapply(allSplit, FUN = function (l) {
                                  if(length(l)==1) { ret <- NA}  else { ret <- l[length(l)]}
                                  return(ret)})), stringsAsFactors = FALSE))
  }
  return(ret)}
