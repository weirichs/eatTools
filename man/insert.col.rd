\name{insert.col}
\alias{insert.col}
\title{Insert Columns into a \code{data.frame} at a Specific Position
}
\description{
  Insert columns into a \code{data.frame} at a specific position. Transforms \code{tibble} or \code{data.table} to \code{data.frame}.
}
\usage{
  insert.col(dat, toinsert, after)
}
\arguments{
  \item{dat}{A data frame}
  \item{toinsert}{Column name(s) or column number(s) of the columns to be reinserted }
  \item{after}{Column name or column number after which the columns specified in \code{insert} should be reinserted.}

}
\value{
  A	data frame with columns in specified positions.
}
