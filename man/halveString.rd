\name{halveString}
\alias{halveString}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Split string exactly in two parts}
\description{\code{strsplit} splits a string according to a specific sign. The number
of occurrences of the splitting sign defines the number of splits. \code{halveString}
allows to split the string in only two parts, no matter how often the splitting sign occurs.}
\usage{
halveString (string, pattern, first = TRUE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{string}{
%%     ~~Describe \code{file} here~~
A character vector.
}
  \item{pattern}{
%%     ~~Describe \code{file} here~~
character vector (or object which can be coerced to such) to use for splitting.
}
  \item{first}{
%%     ~~Describe \code{file} here~~
Logical: Relevant if the pattern occurs more than one time in the string. Defines whether
the first (default) or last occurrence is used for splitting.
}
}
\value{
A data.frame with two columns
}
\author{
Sebastian Weirich
}
\examples{
str <- c("John_Bolton", "Richard_Milhouse_Nixon", "Madonna")
strsplit(str, split = "_")
halveString(str, pattern = "_")
halveString(str, pattern = "_", first=FALSE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
