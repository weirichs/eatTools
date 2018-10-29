\name{tableUnlist}
\alias{tableUnlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Frequency table for data frames, e.g. across multiple columns}
\description{Replaces the somehow buggy function combination table(unlist(data)).}
\usage{
tableUnlist(dataFrame, verbose = TRUE, useNA = c("no", "ifany",
    "always"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataFrame}{
%%     ~~Describe \code{file} here~~
Data frame with more than one column.
}
  \item{verbose}{
%%     ~~Describe \code{file} here~~
Logical: print messages to console?
}
  \item{useNA}{
%%     ~~Describe \code{file} here~~
whether to include NA values in the table. See help file of \code{table} for more details.
}
}
\value{
A freqency table
}
\author{
Sebastian Weirich
}
\examples{
dat  <- data.frame ( matrix ( data = sample(0:1,200,replace=TRUE), nrow=20, ncol=10))
tableUnlist(dat)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
