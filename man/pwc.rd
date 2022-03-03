\name{pwc}
\alias{pwc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Part-whole correlation for numeric data frames}
\description{Computes the part-whole correlation (correlation of an item
with the whole scale except for this item)}
\usage{
pwc(dat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
a data.frame with numeric columns (items)
}
}
\value{
A data.frame with three columns: First column item identifier, second column with
conventional item-scale correlation, third column with part-whole correlation
}
\examples{
dat <- data.frame ( item1 = c(0,1,1,3), item2 = c(2,3,1,3), item3 = c(1, NA, 3,3))
pwc(dat)
}
