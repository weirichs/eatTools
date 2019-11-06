\name{removeNonNumeric}
\alias{removeNonNumeric}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Removes all non-numeric characters from a string.}
\description{Function removes all non-numeric characters from a string.}
\usage{
removeNonNumeric ( string)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{string}{
%%     ~~Describe \code{file} here~~
a character vector
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a character string
}
\author{
Sebastian Weirich
}
\examples{
str <- c(".d1.nh.120", "empty", "110", ".nh.dgd", "only.nh")
removeNonNumeric(str)
}

