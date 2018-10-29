\name{make.pseudo}
\alias{make.pseudo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform ratings from real raters into pseudo ratings}
\description{Data from large-scale assessments often are rated by
multiple raters. This function reduces the number of raters by the use
of ``pseudo raters''.}
\usage{
make.pseudo (datLong, idCol, varCol, codCol, valueCol, n.pseudo, randomize.order = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{datLong}{
%%     ~~Describe \code{file} here~~
Data set in the longformat, i.e. one row per examinee-variable-rater combination.
}
  \item{idCol}{
%%     ~~Describe \code{file} here~~
Name or column number of the person identifier (ID) variable.
}
  \item{varCol}{
%%     ~~Describe \code{file} here~~
Name or column number of the variable identifier.
}
  \item{codCol}{
%%     ~~Describe \code{file} here~~
Name or column number of the rater identifier variable.
}
  \item{valueCol}{
%%     ~~Describe \code{file} here~~
Name or column number of the value variable.
}
  \item{n.pseudo}{
%%     ~~Describe \code{file} here~~
How many pseudo rater should be used? (value must be lower than the number of real raters)
}
  \item{randomize.order}{
%%     ~~Describe \code{file} here~~
Logical: if TRUE, the selection of raters to pseudo raters is random.
}
}
\value{
A data.frame in the long format.
}
\author{
Sebastian Weirich
}
\examples{
data(rater)
oneRater <- make.pseudo (datLong=rater, idCol="id", varCol="variable", codCol="rater",
            valueCol="value", n.pseudo=1)
twoRaters<- make.pseudo (datLong=rater, idCol="id", varCol="variable", codCol="rater",
            valueCol="value", n.pseudo=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
