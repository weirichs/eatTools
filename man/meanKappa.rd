\name{meanKappa}
\alias{meanKappa}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Cohens kappa among several raters}
\description{This is a wrapper for the \code{kappa2} function from the \code{irr}
package. Function computes Cohens kappa among several raters (at least 2) for
one item and several persons.}
\usage{
meanKappa( dat , weight = "unweighted" , weight.mean = TRUE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
Data frame with at least two columns, with examinees in the rows and raters in the columns.
}
  \item{weight}{
%%     ~~Describe \code{file} here~~
either a character string specifying one predefined set of weights or a numeric
vector with own weights (see details). (see help file of the \code{kappa2} function).
}
  \item{weight.mean}{
%%     ~~Describe \code{file} here~~
Logical: TRUE, if agreement is weighted by number of rater subjects. FALSE, if it is
averaged among all rater pairs.
}
}
\value{
A list. First element is a data frame with kappa values between raters pairs.
Second element is a scalar with mean kappa among all raters.
}
\author{
Alexander Robitzsch
}
\examples{
data(rater)
v01 <- subset(rater, variable == "V01")
dat <- reshape2::dcast( v01, id~rater, value.var = "value")
kap <- meanKappa(dat[,-1])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
