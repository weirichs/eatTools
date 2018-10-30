\name{tablePattern}
\alias{tablePattern}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Creates skeleton for frequency tables with desired values}
\description{Function takes values and creates a frequency table including these values. Models behaviour of factor variables.}
\usage{
tablePattern (x, pattern = NULL, weights, na.rm = TRUE, useNA = c("no", "ifany", "always"))}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{file} here~~
a vector
}
  \item{pattern}{
%%     ~~Describe \code{file} here~~
desired values for table output
}
  \item{weights}{
optional: weights
}
 \item{na.rm}{
should missing values be removed
}
 \item{useNA}{
whether to include [NA] values in the table
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
a frequency table
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
grades <- c(1,1,3,4,2,3,4,5,5,3,2,1)
table(grades)
tablePattern(grades, pattern = 1:6)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
