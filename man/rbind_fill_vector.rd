\name{rbind_fill_vector}
\alias{rbind_fill_vector}
\title{Combine vectors of unequal length by row, filling missing columns with NA.}
\description{\code{rbind}s a list of vectors of unequal length to a data.frame. Missing columns are filled with NA.}
\usage{
rbind_fill_vector(x)
}
\arguments{
  \item{x}{
A list of vectors. Each element of x must have a dimension of \code{NULL}.
}
}
\value{
a single data frame
}
\examples{
a <- list(NULL, 1:2, NA, "a", 11:13)
rbind_fill_vector(a)
}
