\name{removeUmlaut}
\alias{removeUmlaut}
\title{Removes special characters from a string or factor variable while providing the factor structure.}
\description{If unwanted characters are removed from a character string in a factor variable, this can lead
to a change in the factor structure (accoring to the reference category, for example). \code{removeUmlaut}
restores the factor structure after removing special characters. Function is mainly used internally in the
eatRep and eatModel packages.}
\usage{
removeUmlaut(var)}
\arguments{
  \item{var}{
a character or factor variable
}
}
\value{
a character or factor variable with removed special characters
}
\examples{
fac1 <- factor(c("Tablet-Paper", "Computer.(Laptop)", "Computer.(Laptop)"), levels = c("Tablet-Paper", "Computer.(Laptop)"))
table(fac1)
fac2 <- removeUmlaut(fac1)
fac2
}

