\name{readMultisep}
\alias{readMultisep}
\title{Read in data.frames with separator characters >=1Byte}
\description{Read in character separated data.frames with separator characters >=1Byte.}
\usage{
readMultisep(file, sep, colnames=TRUE)
}
\arguments{
  \item{file}{
the name of the file which the data are to be read from.
}
  \item{sep}{
the field separator character(s).
}
  \item{colnames}{
logical. Whether first line in file contains colnames.
}
}
\value{
A data frame containing a representation of the data in the file.
}

\examples{
filePath <- tempfile(fileext = ".txt")
dat <- data.frame(v1 = c("0","300","e",NA),
                  v2=c("0","90","10000",NA),
                  v3=c("k","kk","kkk",NA),
                  v4=NA,
                  v5=c("0","90","100","1"))
write.table(dat, file = filePath, row.names = FALSE, col.names = FALSE, sep = "]&;")
readMultisep(filePath, sep="]&;")
}
