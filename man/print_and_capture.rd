\name{print_and_capture}
\alias{print_and_capture}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Easy integration of (small) tables into (error) messages}
\description{Some (error) messages are more understandable if small (frequency)
tables are used for clearness. The function simplifies integration of these tables.}
\usage{
print_and_capture (x, spaces = 0) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
The object which should be integrated. Normally, a (small) table or data frame.
}
  \item{spaces}{
Number of spaces between left border and the table
}
}
\value{
a string which may be combined with messages
}
\examples{
frequency.table <- as.table(matrix(c(12,0,5,7),2,2))
attr(frequency.table, "dimnames") <- list("sex" = c("male", "female"),
                "migration" = c(TRUE, FALSE))
message("Some combinations of variables with zero observations: \n",
        print_and_capture(frequency.table, spaces = 5))
}
