\name{tableUnlist}
\alias{tableUnlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Frequency table for data frames, e.g. across multiple columns}
\description{Replaces the somehow buggy function combination \code{table(unlist(data))}.}
\usage{
tableUnlist(dataFrame, useNA = c("no", "ifany",
    "always"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataFrame}{
%%     ~~Describe \code{file} here~~
Data frame with more than one column.
}
  \item{useNA}{
%%     ~~Describe \code{file} here~~
whether to include NA values in the table. See help file of \code{table} for more details.
}
}
\value{
A frequency table
}
\author{
Sebastian Weirich
}
\examples{
dat  <- data.frame ( matrix ( data = sample(0:1,200,replace=TRUE), nrow=20, ncol=10))
tableUnlist(dat)
}
