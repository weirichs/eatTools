\name{desk}
\alias{desk}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Descriptive statistics for one or several variables}
\description{Function computes descriptive statistics for one variable
or several variables within a data frame.}
\usage{
desk (variable,na=NA, p.weights = NULL, na.rm = FALSE) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{variable}{
%%     ~~Describe \code{file} here~~
one variable or a data.frame with several variables
}
  \item{na}{
%%     ~~Describe \code{file} here~~
optional values with should be considered a missing values
}
  \item{p.weights}{
%%     ~~Describe \code{file} here~~
optional: vector with idividual weights if weighted statistics should be computed
}
  \item{na.rm}{
%%     ~~Describe \code{file} here~~
logical: should missings be removed prior to estimation?
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
a data frame
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Sebastian Weirich
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(rater)
desk(rater)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
