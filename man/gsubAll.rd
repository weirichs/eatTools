\name{gsubAll}
\alias{gsubAll}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Pattern matching and replacement}
\description{Function is a wrapper for \code{gsub()} which allows to replace more than one pattern.
Does not allow using regular expressions (internally, \code{gsub(..., fixed = TRUE)} is used).}
\usage{gsubAll ( string, old, new)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{string}{a character vector where matches are sought}
  \item{old}{
%%     ~~Describe \code{dif.term} here~~
character vector containing strings to be matched in the given character vector named \code{string}.
Can only contain unique entries.
}
  \item{new}{
%%     ~~Describe \code{split.dif} here~~
a replacement for matched pattern
}
}
\details{
Internally, the function calls \code{gsub()} repeatedly, beginning with the longest string in \code{old}.
String length is evaluated using \code{nchar()}.
This is done to avoid repeated modifications if strings in \code{old} match each other.
}
\value{
character vector with replaced patterns
}
\examples{
### replace all numbers by words
txt <- "1 example for 2 reasons in 4 seasons"
gsubAll ( txt, old = as.character(1:4), new = c("one", "two", "three", "four"))
}
