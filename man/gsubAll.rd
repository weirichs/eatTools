\name{gsubAll}
\alias{gsubAll}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Pattern matching and replacement}
\description{Function is a wrapper for \code{gsub()} which allows to replace more than one pattern.}
\usage{gsubAll ( string, old, new)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{string}{a character vector where matches are sought}
  \item{old}{
%%     ~~Describe \code{dif.term} here~~
character vector containing strings to be matched in the given character vector named \code{string}.
}
  \item{new}{
%%     ~~Describe \code{split.dif} here~~
a replacement for matched pattern
}
}
\value{
character vector with replaced patterns
}
\author{
Benjamin Becker
}
\examples{
### replace all numbers by words
txt <- "1 example for 2 reasons in 4 seasons"
gsubAll ( txt, old = as.character(1:4), new = c("one", "two", "three", "four"))
}
