\name{cleanifyString}
\alias{cleanifyString}
\title{Removes special characters}
\description{Removes special characters from a character string. Also applicable to factor variables and \code{data.frames}.}
\usage{
cleanifyString(x, removeNonAlphaNum = TRUE, replaceSpecialChars = TRUE,
              oldEncoding = NULL, ...)
}
\arguments{
  \item{x}{
a character variable, factor variable or \code{data.frame}
}
  \item{removeNonAlphaNum}{
logical. If \code{TRUE}, all non-alphanumeric characters are removed. Default is \code{TRUE}.
  }
  \item{replaceSpecialChars}{
logical. If \code{TRUE}, special characters are replaced. Default is \code{TRUE}.
}
  \item{oldEncoding}{
character. The encoding of the input data if it should be transformed to \code{"UTF-8"}.
}
  \item{...}{
further arguments passed to other methods.
}
}
\details{
If unwanted characters are removed from a character string in a factor variable, this can lead
to a change in the factor structure (accoring to the reference category, for example). \code{cleanifyString}
restores the factor structure after removing special characters. Function is mainly used internally in the
\code{eatRep}, \code{eatGADS}, and \code{eatModel} packages.
}
\value{
a character variable, factor variable or \code{data.frame} with removed special characters
}
\examples{
fac1 <- factor(c("Tablet-Paper", "Computer.(Laptop)", "Computer.(Laptop)"),
               levels = c("Tablet-Paper", "Computer.(Laptop)"))
table(fac1)

# Remove special characters
fac2 <- cleanifyString(fac1)
fac2
}

