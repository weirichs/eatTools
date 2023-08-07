\name{makeTria}
\alias{makeTria}
\title{Reshapes an unordered covariance/correlation matrix into triangular shape}
\description{Function is mainly used for \code{\link{wtdHetcor}} and
\code{q3FromRes} functions in the eatModel package:
Triangular covariance/correlation matrices are tidily reshaped.}
\usage{
makeTria (dfr)}
\arguments{
  \item{dfr}{
A data frame consisting of a row name column and a square matrix.
}
}
\value{
data frame.
}
\examples{
dfr <- data.frame ( vars = paste0("var", 2:4), matrix(c(1:3, NA, NA, 5, 4,NA,6),
       nrow=3, ncol=3, dimnames=list(NULL, paste0("var", 1:3))))
makeTria(dfr)
}
