\name{asNumericIfPossible}
\alias{asNumericIfPossible}
\title{
Convert a Vector or Data Frame Into Numeric Values If Possible
}
\description{
This function converts vectors of all kinds to \code{numeric}. The function can also be used to converte all
columns of a data frame to class \code{numeric} for which this conversion is possible
i.e. without creating \code{NA} when it fails. Non-convertible columns are maintained.
}
\usage{
asNumericIfPossible(x, maintain.factor.scores = TRUE, force.string = TRUE, transform.factors = TRUE, varName = NULL)
}
\arguments{
  \item{x}{A vector or data frame which should be converted. }
  \item{maintain.factor.scores}{Logical:
                                  If \code{TRUE}, conversion of the factor levels is attempted
                                  (like in \code{as.numeric(as.character(f))}).
                                  If \code{FALSE}, the internal codes of the factor are returned
                                  (like in \code{as.numeric(f)}).
                                  See 'Details'. This argument is only evaluated if \code{transform.factors = TRUE}.  }
  \item{force.string }{Logical indicating whether columns should be force to numeric, even if NAs are induced.
                              If \code{FALSE}, affected columns are maintained.
                              If \code{TRUE}, conversion is forced.   }
  \item{transform.factors }{Logical indicating whether columns of class \code{factor} should be converted.
                              If \code{FALSE}, columns of class \code{factor} are maintained.
                              If \code{TRUE}, conversion of factors is attempted.   }
    \item{varName }{Optional: Name of the corresponding variable. Doesn't have to be changed by user.}
}
\details{
In \R, factors may represent ordered categories or categorical variables. Depending on the meaning of the variable, a conversion
of the nominal values (of a factor variable) to numeric values may be desirable or not. The arguments \code{transform.factors}
and \code{maintain.factor.scores} specify if and how factor variables should be treated. See examples.
}
\author{
Sebastian Weirich, Karoline Sachse, Benjamin Becker
}
\examples{
dat <- data.frame(X1 = c("1",NA,"0"), X2 = c("a",NA,"b"),
                  X3 = c(TRUE,FALSE,FALSE), X4 = as.factor(c("a",NA,"b")),
                  X5 = as.factor(c("5","6","7")), stringsAsFactors = FALSE)
str(dat)
asNumericIfPossible(dat)
asNumericIfPossible(dat, transform.factors=TRUE,
                      maintain.factor.scores=FALSE)
asNumericIfPossible(dat, transform.factors=TRUE,
                      maintain.factor.scores=TRUE)
}
