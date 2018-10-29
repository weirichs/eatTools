\name{crop}
\alias{crop}

\title{Remove Trailing and Leading Characters From Character Strings}

\description{
Similarly to the function \code{trim} from the \code{gdata} package, this function
can be used to remove trailing and leading spaces from character strings. However, 
in contrast to \code{trim}, any character can be removed by \code{crop}.
}

\usage{
crop(x, char = " ")
}

\arguments{

  \item{x}{ character string }
  \item{char}{character to be removed from beginning and end of \code{x} }

}

\author{
Martin Hecht, Sebastian Weirich
}
\examples{
str <- c(" 12  kk ", "op j    q ", "110")
crop(str)
crop(str, "op")
}
