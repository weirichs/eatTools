\name{facToChar}
\alias{facToChar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform columns in a data frame}
\description{Function transforms all data frame columns of a specific class
into another class.}
\usage{
facToChar ( dataFrame, from = "factor", to = "character")}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataFrame}{
%%     ~~Describe \code{file} here~~
a data frame
}
  \item{from}{
%%     ~~Describe \code{file} here~~
which column class shuld be transformed?
}
  \item{to}{
%%     ~~Describe \code{file} here~~
target column class
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
### original classes
sapply(rater, class)
rater1 <- facToChar(rater, from = "character", to = "factor")
sapply(rater1, class)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
