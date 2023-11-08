\name{halveString}
\alias{halveString}
\title{Split string exactly in two parts}
\description{\code{strsplit} splits a string according to a specific sign. The number
of occurrences of the splitting sign defines the number of splits. \code{halveString}
allows to split the string in only two parts, no matter how often the splitting sign occurs.}
\usage{
halveString (string, pattern, first = TRUE , colnames=c("X1", "X2"))
}
\arguments{
  \item{string}{
A character vector.
}
  \item{pattern}{
character vector (or object which can be coerced to such) to use for splitting.
}
  \item{first}{
Logical: Relevant if the pattern occurs more than one time in the string. Defines whether
the first (default) or last occurrence is used for splitting.
}
  \item{colnames}{
Optional: character vector of length 2 to specify the colnames of the resulting data.frame.
}
}
\value{
A matrix with two columns
}
\examples{
str1 <- c("John_Bolton", "Richard_Milhouse_Nixon", "Madonna")
strsplit(str, split = "_")
halveString(str, pattern = "_")
halveString(str, pattern = "_", first=FALSE)

# split patterns with more than one character and regular expression
str2 <- c("John._.Bolton", "Richard._.Milhouse._.Nixon", "Madonna")
halveString(str2, pattern = "\\._\\.", first=FALSE)
}
