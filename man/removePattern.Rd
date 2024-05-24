\name{removePattern}
\alias{removePattern}
\title{Removes a specified pattern from a string.}
\description{Function remove a specified string from a character vector.}
\usage{
removePattern ( string, pattern)}
\arguments{
  \item{string}{
a character vector
}
  \item{pattern}{
a character pattern of length 1
}
}
\value{
a character string
}
\examples{
str <- c(".d1.nh.120", "empty", "110", ".nh.dgd", "only.nh")
removePattern(str, ".nh.")
}

