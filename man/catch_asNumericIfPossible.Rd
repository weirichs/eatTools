\name{catch_asNumericIfPossible}
\alias{catch_asNumericIfPossible}
\title{
Use asNumericIfPossible with modified warning.
}
\description{
This function uses \code{asNumericIfPossible} but lets the user change the warning
issued by \code{asNumericIfPossible}. Suited for use in other \code{R} packages.
}
\usage{
catch_asNumericIfPossible(x, warn, maintain.factor.scores = TRUE,
force.string = TRUE, transform.factors = TRUE)
}
\arguments{
  \item{x}{A vector or data frame which should be converted. }
  \item{warn}{A character vector of length 1 with the desired warning. }
  \item{maintain.factor.scores}{Logical:
        If \code{TRUE}, conversion of the factor levels is attempted
        (like in \code{as.numeric(as.character(f))}).
        If \code{FALSE}, the internal codes of the factor are returned
        (like in \code{as.numeric(f)}).
        See 'Details'. This argument is only evaluated if
        \code{transform.factors = TRUE}.  }
  \item{force.string }{Logical indicating whether columns should be force to
  numeric, even if NAs are induced.
        If \code{FALSE}, affected columns are maintained.
        If \code{TRUE}, conversion is forced.   }
  \item{transform.factors }{Logical indicating whether columns of class
  \code{factor} should be converted.
        If \code{FALSE}, columns of class \code{factor} are maintained.
        If \code{TRUE}, conversion of factors is attempted.   }
}
\details{
For details see \code{\link{asNumericIfPossible}}
}
\author{
Benjamin Becker
}
\examples{
char <- c("a", "b", 1)
catch_asNumericIfPossible(x = char, warn = "Vector could not be converted")
}
