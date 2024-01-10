
`%$$%` <- function(x, y) {
  ylab <- deparse(substitute(y))
  xlab <- deparse(substitute(x))
  if(!ylab %in% names(x)) {stop("Element '", ylab, "' is not defined in list '",xlab,"'")}
  do.call(.Primitive("$"), list(x, ylab))}