
asNumeric_new <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = FALSE) {
  UseMethod("asNumeric_new")
}

asNumeric_new.default <- function(x, ...) {
  stop("Unknown input type or class. Input has to be of type numeric, factor, character or data.frame.")
}

asNumeric_new.numeric <- function(x, ...) {
  x
}

asNumeric_new.factor <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE) {
  if(transform.factors == FALSE) return(x)
  if(maintain.factor.scores) {
    x <- as.character(x)
    y <- asNumeric_new(x, maintain.factor.scores = maintain.factor.scores,
                       force.string = force.string)
    # Maintaint type factor if asNumeric was unsuccessful
    if(is.character(y)) return(as.factor(y))
    return(y)
  }
  as.numeric(x)
}

asNumeric_new.character <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, ...) {
  y <- tryCatch(as.numeric(x), warning = function(w) {
    out <- suppressWarnings(as.numeric(x))
    class(out) <- c("warning", "numeric")
    out
  })
  if(force.string) {
    if("warning" %in% class(y)) {
      warning("Variable has been coerced to numeric, NAs have been induced.", call. = FALSE)
      class(y) <- class(y)[[2]]
    }
    return(y)
  }
  if("warning" %in% class(y)) {
    warning("Variable can not be transformed to numeric. Use force.string = T to force this.", call. = FALSE)
    return(x)
  }
  y
}

#### tbd: anpassen, dass maintain.factor.scores keine Auswirkungen auf character variablen hat!!
asNumeric_new.data.frame <- function(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = FALSE){
  df_list <- Map(changeWarning_asNumeric_new, x = x, varName = names(x),
                 maintain.factor.scores = maintain.factor.scores, force.string = force.string, transform.factors = transform.factors)
  out <- as.data.frame(df_list)

  row.names(out) <- attr(x, "row.names")
  out
}

changeWarning_asNumeric_new <- function(x, varName, maintain.factor.scores, force.string, transform.factors) {
  y <- tryCatch(asNumeric_new(x, maintain.factor.scores = maintain.factor.scores, force.string = force.string, transform.factors = transform.factors),
                warning = function(w) {
      out <- suppressWarnings(asNumeric_new(x, maintain.factor.scores = maintain.factor.scores, force.string = force.string, transform.factors = transform.factors))
      w <- sub("Variable", varName, w)
      warning(w, call. = FALSE)
      out
  })
  y
}




#### Archiv
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
