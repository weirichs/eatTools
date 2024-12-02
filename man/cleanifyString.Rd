\name{cleanifyString}
\alias{cleanifyString}
\title{Removes special characters}
\description{Removes special characters from a character string. Also applicable to factor variables and \code{data.frames}.}
\usage{
cleanifyString(x)}
\arguments{
  \item{x}{
a character variable, factor variable or \code{data.frame}
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

