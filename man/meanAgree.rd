\name{meanAgree}
\alias{meanAgree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{mean agreement among several raters}
\description{This is a wrapper for the \code{agree} function from the \code{irr}
package. Function computes mean agreement among several raters (at least 2) for
one item and several persons.}
\usage{
meanAgree( dat , tolerance = 0 , weight.mean = TRUE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
Data frame with at least two columns, with examinees in the rows and raters in the columns.
}
  \item{tolerance}{
%%     ~~Describe \code{file} here~~
number of successive rating categories that should be regarded as rater agreement (see
help file of the \code{agree} function).
}
  \item{weight.mean}{
%%     ~~Describe \code{file} here~~
Logical: TRUE, if agreement is weighted by number of rater subjects. FALSE, if it is
averaged among all rater pairs.
}
}
\value{
A list. First element is a data frame with proportional agreement between raters pairs.
Second element is a scalar with mean agreement among all raters.
}
\author{
Alexander Robitzsch
}
\examples{
data(rater)
v01 <- subset(rater, variable == "V01")
dat <- reshape2::dcast( v01, id~rater, value.var = "value")
agr <- meanAgree(dat[,-1])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
