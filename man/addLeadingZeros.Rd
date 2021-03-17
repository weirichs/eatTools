\name{addLeadingZerosToCharInt}
\alias{addLeadingZerosToCharInt}
\title{Add leading zeros to all columns that can be identified as integers in a character data.frame}
\description{Adds leading zeros to all columns that can be identified as integers in a data.frame that consists of character columns only.}
\usage{
addLeadingZerosToCharInt(dat)
}
\arguments{
  \item{dat}{
a data.frame consisting of character columns only
}
}
\value{
a data.frame of only character columns and the same dimension as the input data.frame where all columns with integers are all of the same arity now due to added leading zeros.
}
\author{
Karoline Sachse
}
\examples{
dat <- data.frame(v1 = c("0","300","e",NA), v2=c("0","90","10000",NA),v3=c("k","kk","kkk",NA),v4=NA,v5=c("0","90","100","1"))
dat <- set.col.type(dat)
addLeadingZerosToCharInt(dat)
}
