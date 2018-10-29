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
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a character string
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
str <- c(".d1.nh.120", "empty", "110", ".nh.dgd", "only.nh")
removeNonNumeric(str)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
