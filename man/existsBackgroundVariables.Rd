\name{existsBackgroundVariables}
\alias{existsBackgroundVariables}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Internally needed function for consistency checks and data preparation.}
\description{Function is necessary for \code{eatRep} and \code{eatModel} as well
and therefore exported to namespace.}
\usage{
existsBackgroundVariables (dat, variable, warnIfMissing = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
A data frame
}
  \item{variable}{
%%     ~~Describe \code{file} here~~
column number or variable name
}
  \item{warnIfMissing}{
%%     ~~Describe \code{file} here~~
Logical: gives a warning if the variable contains missing values
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a structured list of variable names
}
\author{
Sebastian Weirich
}
\examples{
data(mtcars)
existsBackgroundVariables(mtcars, 2:4)
}

