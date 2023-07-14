\name{seq2}
\alias{seq2}
\title{
Sequence generation
}
\description{
Creates a sequence of integers. Modified version of \code{seq} returning an empty vector if the starting point is larger than the end point.
Originally provided by \code{rlang::seq2()}.
}
\usage{
seq2(from, to)
}
\arguments{

  \item{from}{The starting value of the sequence. Of length 1.}
  \item{to}{The end value of the sequence. Of length 1.}

}
\value{
A numerical sequence
}
\examples{
seq2(from = 1, to = 5)
}
