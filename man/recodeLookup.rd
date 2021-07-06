\name{recodeLookup}
\alias{recodeLookup}
\title{Recode a variable according to a lookup table}
\description{Recodes the values of a variable. Function resembles the \code{recode}
function from the \code{car} package, but uses a lookup table to specify old and new values. }
\usage{
recodeLookup(var, lookup)
}
\arguments{
  \item{var}{
a vector (e.g. numeric, character, or factor)
}
  \item{lookup}{
a data.frame with exact two columns. First column contains old values, second column new values.
Values which do not occur in the old column remain unchanged.
}
}
\value{
a vector of the same length as \code{var} with recoded values
}
\examples{
num_var <- sample(1:10, size = 10, replace = TRUE)
lookup  <- data.frame(old = c(2, 4, 6), new = c(200,400,600))
num_var2<- recodeLookup(num_var, lookup)
}
