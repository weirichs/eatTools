\name{item.logit}
\alias{item.logit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Simulates 1PL or 2PL responses}
\description{Function simulates responses following a 1PL or 2PL model given item parameters assuming normally distributed person parameters.}
\usage{
item.logit ( z, slope = 1, thr )}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{
%%     ~~Describe \code{file} here~~
a vector of item difficulties
}
  \item{slope}{
%%     ~~Describe \code{file} here~~
a vector of item discrimination parameters. Default is 1 and equals a 1PL model.
}
  \item{thr}{
%%     ~~Describe \code{file} here~~
a vector of item threshold parameters
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a list with two matrices. First matrix includes the responses, seconds matrix includes the correct response probabilities.
}
\author{
Ulf Kroehne
}
\examples{
z <- rnorm(30, 0, 1)
d <- item.logit(z = z, thr = 0)
}
