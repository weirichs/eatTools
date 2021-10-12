\name{roundDF}
\alias{roundDF}
\title{Round data frame.}
\usage{
roundDF(df, roundN = 3)
}
\arguments{
\item{df}{A \code{data.frame}.}

\item{roundN}{Integer indicating the number of decimal places.}
}
\value{
Returns the rounded \code{data.frame}.
}
\description{
Round all numeric variables in a \code{data.frame}.
}
\examples{
roundDF(mtcars, roundN = 0)
}
