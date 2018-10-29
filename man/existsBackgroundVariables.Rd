\name{existsBackgroundVariables}
\alias{existsBackgroundVariables}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Internally needed function for consistency checks and data preparation.}
\description{Function is necessary for \code{eatRep} and \code{eatModel} as well
and therefore exported to namespace.}
\usage{
existsBackgroundVariables (dat, variable)
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
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a structured list of variable names
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Sebastian Weirich
}
\examples{
data(lsa)
existsBackgroundVariables(lsa, 2:4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
