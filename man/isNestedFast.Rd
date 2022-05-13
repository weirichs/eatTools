\name{isNestedFast}
\alias{isNestedFast}
\title{Is a variable nested?}
\usage{
isNestedFast(dat, idVar, varName)
}
\arguments{
\item{dat}{A \code{data.frame}.}

\item{idVar}{The name of the identifier variable in \code{dat}.}

\item{varName}{The name of the variable in \code{dat} which should be tested for nestedness.}
}
\value{
Returns a logical of length 1.
}
\description{
Tests if a variable within a \code{data.frame} is nested within an identifier variable. The function works similar to
\code{lme4::isNested()} but is substantially faster.
}
\examples{
# create example data.frame
dat <- data.frame(ID = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
           imp = rep(1:3, 3),
           v1 = c(10, 10, 10, 9, 8, 9, 6, 6, 6))
isNestedFast(dat, idVar = "ID", varName = "v1")
}
