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
\value{
a data frame with the following columns
  \item{N}{
number of observations
}
  \item{N.valid}{
number of non-missing observations
}
  \item{Missing}{
number of missings
}
  \item{Minimum}{
minimum of numeric variables
}
  \item{Maximum}{
maximum of numeric variables
}
  \item{Sum}{
sum of numeric variables
}
  \item{Mean}{
arithmetic mean of numeric variables
}
  \item{std.err}{
standard error of the arithmetic mean. Note: for weighted means, standard error
is estimated according to Cochran (1977): \eqn{sigma_x^2=n/((n-1)*w_s^2)*Sigma(w_i^2*(x_i-x))}.
}
  \item{sig}{
p value
}
  \item{Median}{
median of numeric varables
}
  \item{SD}{
standard deviation of numeric varables
}
  \item{Var}{
variance of numeric variables
}
}
\references{
Cochran W. G. (1977). \emph{Sampling Techniques} (3rd Edn). Wiley, New York
}
\author{
Sebastian Weirich
}
\examples{
data(rater)
desk(rater)
}

