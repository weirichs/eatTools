\name{multiseq}
\alias{multiseq}
\title{
multiple sequences
}
\description{
creates a sequence for every unique value in a vector
}
\usage{
multiseq(v)
}
\arguments{

  \item{v}{ a vector }
  
}
\value{
a vector with multiple sequences
}
\author{
Martin Hecht
}
\examples{
v <- c("a", "a", "a", "c", "b", "b" , "a")
multiseq(v)
}
