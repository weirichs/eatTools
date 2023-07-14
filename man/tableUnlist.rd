\name{tableUnlist}
\alias{tableUnlist}
\title{Frequency table for data frames, e.g. across multiple columns}
\description{Replaces the somehow buggy function combination \code{table(unlist(data))}.}
\usage{
tableUnlist(dataFrame, useNA = c("no", "ifany",
    "always"))
}
\arguments{
  \item{dataFrame}{
Data frame with more than one column.
}
  \item{useNA}{
whether to include NA values in the table. See help file of \code{table} for more details.
}
}
\value{
A frequency table
}
\examples{
dat  <- data.frame ( matrix ( data = sample(0:1,200,replace=TRUE), nrow=20, ncol=10))
tableUnlist(dat)
}
