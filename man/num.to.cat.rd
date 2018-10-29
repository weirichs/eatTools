\name{num.to.cat}
\alias{num.to.cat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform continuous variables into ordered factors}
\description{Function is useful if parameters on the `PISA' metric should be transformed into competence levels. }
\usage{
num.to.cat(x, cut.points, cat.values = NULL)}  
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{file} here~~
Numeric vector.
}
  \item{cut.points}{
%%     ~~Describe \code{file} here~~
Numeric vector with cut scores.
}
  \item{cat.values}{
%%     ~~Describe \code{file} here~~
Optional: vector with labels for the cut scores. Note: if specified, length of 
cat.values should be length(cut.points)+1.
}
}
\value{
Vector with factor values. 
}
\author{
Sebastian Weirich
}
\examples{
values <- rnorm(10,0,1.5) * 100 + 500
num.to.cat(x = values, cut.points = 390+0:3*75)
num.to.cat(x = values, cut.points = 390+0:3*75, cat.values = c("1a", "1b", 2:4))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
