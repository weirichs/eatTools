\name{roundDF}
\alias{roundDF}
\title{Round a \code{data.frame}.}
\usage{
roundDF(dat, digits = 3)
}
\arguments{
\item{dat}{A \code{data.frame}.}

\item{digits}{Integer indicating the number of decimal places.}
}
\value{
Returns the rounded \code{data.frame}.
}
\description{
Round all numeric variables in a \code{data.frame}, leave the other variables untouched. Column and row names are preserved.
}
\examples{
roundDF(mtcars, digits = 0)
}
