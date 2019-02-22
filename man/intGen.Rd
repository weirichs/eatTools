\name{intGen}
\alias{intGen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate interaction terms for lm formulas}
\description{Function allows to specify only two-way or three-way interactions
from a set of independent variables.}
\usage{
intGen ( vars, upto = 3)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vars}{
%%     ~~Describe \code{file} here~~
character vector of variables
}
  \item{upto}{
%%     ~~Describe \code{file} here~~
the maximum way of interactions which should be created
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a character string (snippet) useful for formula generation
}
\author{
Sebastian Weirich
}
\examples{
vars <- paste0("Var_", letters[1:5])
### only two way interactions
frml <- intGen(vars = vars, upto = 2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
