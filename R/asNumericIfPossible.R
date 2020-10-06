asNumericIfPossible <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  UseMethod("asNumericIfPossible")
}

asNumericIfPossible.default <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  stop("Unknown input type or class. Input has to be of type numeric, factor, character or data.frame.")
}

asNumericIfPossible.numeric <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  x
}

asNumericIfPossible.logical <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  if (!is.null(dim(x))) {
    x <- matrix(as.numeric(x), nrow=nrow(x), ncol=ncol(x), dimnames=dimnames(x))
  } else {
    x <- as.numeric(x)
  }
  return(x)
}

asNumericIfPossible.factor <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  if(transform.factors == FALSE) return(x)
  if (!is.null(dim(x))) {
      warning("Input 'x' was a matrix. If columns of matrices should be separately transformed to numeric (if possible), 'x' should be a data.frame.")
  }
  if(maintain.factor.scores) {
    y <- as.character(x)
    y <- asNumericIfPossible(y, maintain.factor.scores = maintain.factor.scores,
                       force.string = force.string, varName=varName)
    # Maintaint type factor if asNumeric was unsuccessful
    if(is.character(y)) return(as.factor(y))
    if (!is.null(dim(x))) {
       y <- matrix(y, nrow=nrow(x), ncol=ncol(x), dimnames=dimnames(x))
    }
    return(y)
  }
  if (!is.null(dim(x))) {
      x <- matrix(as.numeric(x), nrow=nrow(x), ncol=ncol(x), dimnames=dimnames(x))
  } else {
    x <- as.numeric(x)
  }
  return(x)
}

asNumericIfPossible.character <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL) {
  if (!is.null(dim(x))) {
      warning("Input 'x' was a matrix. If columns of matrices should be separately transformed to numeric (if possible), 'x' should be a data.frame.")
  }
  if ( is.null(varName)) {
       varName <- "Variable"
  }  else {
       varName <- paste0("'", varName, "'")
  }
  y <- suppressWarnings(as.numeric(x))
  if ( isTRUE(force.string)) {
     if ( length(which(is.na(y))) > length(which(is.na(x))) ) {
        warning(paste0(varName, " has been coerced to numeric, NAs have been induced."), call. = FALSE)
     }
  }  else  {
     if ( length(which(is.na(y))) > length(which(is.na(x))) ) {
        warning(paste0(varName, " can not be transformed to numeric. Use force.string = TRUE to force this."), call. = FALSE)
        y <- x                                                                  ### y wird wieder mit x ueberschrieben
     }

  }
  if (!is.null(dim(x)) && is.null(dim(y))) {
     y <- matrix(y, nrow=nrow(x), ncol=ncol(x), dimnames=dimnames(x))
  }
  return(y)
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
