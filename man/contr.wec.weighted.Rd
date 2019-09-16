\name{contr.wec.weighted}
\alias{contr.wec.weighted}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculates contrasts for a weighted factor variable based on weighted effect coding}
\description{Function works equivalent to \code{contr.wec} from the codewec package, but allows
for weighted contrasts.}
\usage{
contr.wec.weighted (x, omitted, weights)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
grouping variable of class factor
}
  \item{omitted}{
Label of the factor label that should be taken as the omitted category
}
  \item{weights}{
Numeric vector of non-negative weights
}
}
\value{
Returns a contrast matrix based on weighted effect coding.
}
\author{
Sebastian Weirich, based upon the \code{contr.wec} function of the \code{wec} package
}
