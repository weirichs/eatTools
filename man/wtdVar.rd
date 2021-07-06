\name{wtdVar}
\alias{wtdVar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Computed weighted variance}
\description{This functions works quite equally as the \code{wtd.var} function
from the \code{Hmisc} package.}
\usage{
wtdVar(x , weights , na.rm = FALSE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{file} here~~
numeric vector
}
  \item{weights}{
%%     ~~Describe \code{file} here~~
a numeric vector of non-negative weights
}
  \item{na.rm}{
%%     ~~Describe \code{file} here~~
set to \code{FALSE} to suppress checking for NAs. If \code{TRUE}, NAs are removed
from \code{x} as well as from \code{weights} prior to variance estimation.
}
}
\value{
a scalar
}
\author{
Benjamin Becker
}
\examples{
x <- c(50, 1, 25)
w <- c(1, 4, 1)
wtdVar(x, w)
}
