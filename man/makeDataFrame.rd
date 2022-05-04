\name{makeDataFrame}
\alias{makeDataFrame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Converts \code{tbl} or \code{data.table} objects to plain \code{data.frames} for internal processing}
\description{Function is mainly used for internal checks in the eatRep and eatModel package: objects
which expected to be \code{data.frames} for further processing are converted to data.frame when their class
is \code{tbl}, for example.}
\usage{
makeDataFrame (dat, name = "dat")}
\arguments{
  \item{dat}{
An object which is intended to be a \code{data.frame}.
}
  \item{name}{
Optional: name of \code{data.frame} for use in messages
}
}
\value{
data frame.
}
\examples{
dat  <- data.table::data.table(x1 = 1:5, y1 = letters[1:5])
# unexpected in 'classical' data frames
class(dat[,"x1"])
dat  <- makeDataFrame(dat)
}
