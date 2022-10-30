\name{rbind.common}
\alias{rbind.common}
\title{Combine data.frames by row, using only common columns.}
\description{\code{rbind}s a list of data.frames, using only these columns which occur
in each of the single data.frames.}
\usage{
rbind.common(...)
}
\arguments{
  \item{...}{
input data frames to row bind together. The first argument can be a list of data frames,
in which case all other arguments are ignored. Any NULL inputs are silently dropped.
If all inputs are NULL, the output is NULL. If the data.frames have no common columns,
the output is NULL and a warning is given.
}
}
\value{
a single data frame
}
\examples{
### data frame 1
df1 <- data.frame ( a = 1:3, b = TRUE)

### data frame 2
df2 <- data.frame ( d = 100, a = 11:13)

### data frame 3
df3 <- data.frame ( d = 1000, x = 101:103)

### one common col
rbind.common(df1, df2)

### no common cols
rbind.common(df1, df2, df3)
}
