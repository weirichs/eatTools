\name{na_omit_selection}
\alias{na_omit_selection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Drop rows containing missing values}
\description{Drop rows containing missing values in selected columns.}
\usage{
na_omit_selection (dat, varsToOmitIfNA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
a data.frame
}
  \item{varsToOmitIfNA}{
%%     ~~Describe \code{file} here~~
Name or column number of the variables which should be considered for
row deletion due to NAs
}
}
\value{
A data.frame with deleted rows
}
\examples{
dat1 <- data.frame ( v1 = c(1,NA,3), v2 = c(letters[1:2],NA),
                     v3 = c(NA, NA, TRUE), stringsAsFactors = FALSE)
na.omit(dat1)
na_omit_selection(dat1, "v2")
}
