

catch_asNumericIfPossible <- function(x, warn, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE) {
  y <- tryCatch(asNumericIfPossible(x, maintain.factor.scores = maintain.factor.scores, force.string = force.string,
                                    transform.factors = transform.factors),
                warning = function(w) {
                  out <- suppressWarnings(asNumericIfPossible(x, maintain.factor.scores = maintain.factor.scores,
                                                              force.string = force.string, transform.factors = transform.factors))
                  w <- warn
                  warning(w, call. = FALSE)
                  out
                })
  y
}
