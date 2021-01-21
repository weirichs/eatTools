\name{do_call_rbind_withName}
\alias{do_call_rbind_withName}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Row bind a list while assigning names to rows}
\description{Use \code{do.call(rbind, ...)} on a list of \code{data.frames} while creating a new variable
(\code{colName}) which contains, for example, the original list naming (\code{name}).}
\usage{
do_call_rbind_withName(df_list, name = names(df_list), colName)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df_list}{
A list of \code{data.frames}.
}
  \item{name}{
Vector of names to fill \code{colName}. Default uses the names of \code{df_list}.
}
  \item{colName}{
A single character; name for the new column.
}
}
\value{
Returns a \code{data.frame}.
}
\author{
Benjamin Becker
}
\examples{
### create example list
df_list <- lapply(mtcars, function(x) {
  data.frame(m = mean(x), sd = sd(x))
})

### transform to a single data.frame
do_call_rbind_withName(df_list, colName = "variable")
}
