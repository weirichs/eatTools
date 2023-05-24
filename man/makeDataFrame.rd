\name{makeDataFrame}
\alias{makeDataFrame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Converts \code{tbl} or \code{data.table} objects to plain \code{data.frames} for internal processing}
\description{Function is mainly used for internal checks in the eatRep and eatModel package: objects
which expected to be \code{data.frames} for further processing are converted to data.frame when their class
is \code{tbl}, for example.}
\usage{
makeDataFrame (dat, name = "dat", minRow = 1, onlyWarn=TRUE)}
\arguments{
  \item{dat}{
An object which is intended to be a data.frame.
}
  \item{name}{
Optional: name of data.frame for use in messages
}
  \item{minRow}{
When used internally, function report when data.frame has less rows than specified in \code{minRow}.
}
  \item{onlyWarn}{
If \code{TRUE}, function warns if data.frame has less rows than specified in \code{minRow}.
Otherwise, functions aborts with an error message.
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
