asNumericIfPossible <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  checkmate::assert_logical(maintain.factor.scores, len = 1)
  checkmate::assert_logical(force.string, len = 1)
  checkmate::assert_logical(transform.factors, len = 1)
  if (!is.null(varName)){
    checkmate::assert_character(varName)
  }
  UseMethod("asNumericIfPossible")
}

asNumericIfPossible.default <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  stop("Unknown input type or class. Input has to be of class numeric, factor, character or data.frame. If you have used a specific package to import data (e.g., haven) consider transforming your data to factor or character beforehand.")
}

asNumericIfPossible.numeric <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  x
}

asNumericIfPossible.logical <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  as.numeric(x)
}

asNumericIfPossible.factor <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  if(transform.factors == FALSE) return(x)
  if(maintain.factor.scores) {
    x <- as.character(x)
    y <- asNumericIfPossible(x, maintain.factor.scores = maintain.factor.scores,
                       force.string = force.string, varName=varName)
    # Maintaint type factor if asNumeric was unsuccessful
    if(is.character(y)) return(as.factor(y))
    return(y)
  }
  as.numeric(x)
}

asNumericIfPossible.character <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  if ( is.null(varName)) {
       varName <- "Variable"
  }  else {
       varName <- paste0("'", varName, "'")
  }
  y <- tryCatch(as.numeric(x), warning = function(w) {
    out <- suppressWarnings(as.numeric(x))
    class(out) <- c("warning", "numeric")
    out
  })
  if(force.string) {
    if("warning" %in% class(y)) {
      warning(paste0(varName, " has been coerced to numeric, NAs have been induced."), call. = FALSE)
      class(y) <- class(y)[[2]]
    }
    return(y)
  }
  if("warning" %in% class(y)) {
    warning(paste0(varName, " can not be transformed to numeric. Use force.string = TRUE to force this."), call. = FALSE)
    return(x)
  }
  y
}

asNumericIfPossible.matrix <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  matrix_as_vec <- as.vector(x)
  out_vec <- asNumericIfPossible(matrix_as_vec, maintain.factor.scores = maintain.factor.scores, force.string = force.string,
                      transform.factors = transform.factors, varName = "Matrix")
  matrix(out_vec, nrow = nrow(x), dimnames = dimnames(x))
}

asNumericIfPossible.data.frame <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL){
  df_list <- lapply( colnames(x), FUN = function(nam) { asNumericIfPossible(x=x[[nam]],maintain.factor.scores = maintain.factor.scores, force.string = force.string, transform.factors = transform.factors, varName = nam)})
  out <- as.data.frame(df_list, stringsAsFactors = FALSE)
  colnames(out) <- colnames(x)
  row.names(out) <- attr(x, "row.names")
  out
}

#changeWarning_asNumeric <- function(x, varName, maintain.factor.scores, force.string, transform.factors) {
#  y <- tryCatch(asNumericIfPossible(x, maintain.factor.scores = maintain.factor.scores, force.string = force.string, transform.factors = transform.factors),
#                warning = function(w) {
#      out <- suppressWarnings(asNumericIfPossible(x, maintain.factor.scores = maintain.factor.scores,
#                                                  force.string = force.string, transform.factors = transform.factors))
#      w <- sub("Variable", varName, w)
#      warning(w, call. = FALSE)
#      out
#  })
#  y
#}

#### Archiv
# Funktion um urspruenglichen Funktionscall bei rekursiver Funktion zu finden
# wird fuer die tests gebraucht (testthat)
extract_original_call <- function(fun_name, escape) {
  call_list <- lapply(sys.calls(), as.character)
  call_vec <- unlist(lapply(call_list, function(l) l[[1]]))
  call_number <- match(fun_name, call_vec)
  if(is.na(call_number)) {
    warning("Original function call could not be retrieved. ", escape, " has been inserted.")
    return(as.list(rep(escape, 20)))
  }
  #browser()
  as.list(sys.calls()[[call_number]])
}

