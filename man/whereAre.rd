\name{whereAre}
\alias{whereAre}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Matches a scalar with elements of a vector.}
\description{The function closely resembles the \code{match} function, but allows for
multiple matches.}
\usage{
whereAre(a,b,verbose=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{file} here~~
a scalar
}
  \item{b}{
%%     ~~Describe \code{file} here~~
a numeric or character vector
}
  \item{verbose}{
%%     ~~Describe \code{file} here~~
logical: print messages on console?
}
}
\value{
A numeric vector
}
\author{
Sebastian Weirich
}
\examples{
a <- 12
b <- c(10, 11, 12, 10, 11, 12)
match(a, b)
whereAre(a=a, b=b)
}
