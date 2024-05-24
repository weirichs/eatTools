\name{makeTria}
\alias{makeTria}
\title{Reshapes an unordered covariance/correlation matrix into triangular shape}
\description{Function is mainly used for \code{eatAnalysis::wtdHetcor} function from the
\code{eatAnalysis} package (\url{https://github.com/beckerbenj/eatAnalysis/})
and the \code{eatModel::q3FromRes} function in the \code{eatModel}
package: Triangular covariance/correlation matrices are tidily reshaped.}
\usage{
makeTria (dfr)}
\arguments{
  \item{dfr}{
A data frame consisting of a row name column and a square matrix.
}
}
\details{
covariance/correlation matrices which are inherently symmetrical are often displayed
in a space-saving manner by only showing the upper or lower triangular part, omitting the
symmetrical counterpart. In R, covariance/correlation matrices tend to be displayed with their
upper and lower halves. Whereas \code{\link[base]{lower.tri}} and \code{\link[base]{upper.tri}}
allows to replace upper or lower half with \code{NA}s, the triangular shape could then be lost if the
covariance/correlation matrix was provided in a long format and reshaped afterwards. \code{makeTria}
sorts rows and colums appropriately to provide triangular shape if redundant entries are replaced by
NA. Please note that the functions expects row names in the first column of the input data.frame.
}
\value{
data frame.
}
\examples{
dfr <- data.frame ( vars = paste0("var", 2:4), matrix(c(1:3, NA, NA, 5, 4,NA,6),
       nrow=3, ncol=3, dimnames=list(NULL, paste0("var", 1:3))))
makeTria(dfr)
}
