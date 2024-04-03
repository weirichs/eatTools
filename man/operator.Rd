\name{\%$$\%}
\alias{\%$$\%}
\title{
  Extract Parts of an Object (list)
}
\description{
  \code{\%$$\%} is an operator that is mainly used internally in the eatRep and eatModel packages.
  \code{\%$$\%} is similar to \code{$}, but gives error instead of
  \code{NULL} if the corresponding element does not exists.
}
\usage{
x \%$$\% y
}
\arguments{
  \item{x}{
    a list
  }
  \item{y}{
    name of the corresponding element of \code{x}
  }
}
\value{
  the selected element of the list \code{x}
}
\examples{
\dontrun{
x <- list(value1 = 14, value2 = NULL)
x$value2                 # NULL
x$value_not_defined      # NULL
x\%$$\%value2            # NULL
x\%$$\%value_not_defined # error
}}
