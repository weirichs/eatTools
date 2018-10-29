\name{aggregateDataOld}
\alias{aggregateDataOld}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Aggregate variables to items and/or scales.}
\description{This is the old version of \code{aggregateData} from the \code{eatPrep}
package. The function actually is deprecated and might only be used if aggregation
information from the IQB database is not available.}
\usage{
aggregateDataOld (all.daten,spalten, unexpected.pattern.as.na = TRUE, verboseAll = FALSE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{all.daten}{
%%     ~~Describe \code{file} here~~
A data frame in the wide format with at least two (dichotomous) variable columns.
}
  \item{spalten}{
%%     ~~Describe \code{file} here~~
Column names or numbers with variables to aggregate
}
  \item{unexpected.pattern.as.na}{
%%     ~~Describe \code{file} here~~
Logical: TRUE, if non-valid patterns should be aggregated to NA.
}
  \item{verboseAll}{
%%     ~~Describe \code{file} here~~
Logical: Specifies whether exhaustive aggregation information shoul be printed on console.
}
}
\details{
The funtion use a rather simple aggregation rule: all variables which share a common ``stem''
are considered to belong together. The ``stem'' is everything except the last sign. The item
is considered to be correct if all variables are correct. See examples for further details.
}
\value{
A list. First element is a data frame with sum scores. Second element is a data frame
with aggregated scores. Third element is a data frame with information how many variables
are summarizeds for each item.
}
\author{
Sebastian Weirich
}
\examples{
### create artificial data
dat <- data.frame ( id = paste0("P", 11:50),
       matrix(data = sample(x=0:1, size = 400, replace = TRUE),nrow=40, ncol = 10))
### aggregate Item 0+1+2 and 4+5 and 8+9: define sequential letter
colnames(dat)[-1] <- c("I1a", "I1b", "I1c", "I2a", "I3a", "I3b", "I4a", "I5a", "I6a", "I6b")
agg <- aggregateDataOld(dat, -1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
