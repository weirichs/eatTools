\name{createLabelList}
\alias{createLabelList}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Creates a data.frame with variable and value labels from variable attributes.}
\description{By default, 'read.spss' from the foreign package uses variable.labels
as attributes of the whole data.frame, value.labels as attribute of each specific
variable in the data.frame. \code{convertLabel} provides variable and value
labels as variable attributes. \code{createLabelList} creates a data.frame with
variable and value labels.}
\usage{
createLabelList(dfr)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dfr}{
%%     ~~Describe \code{file} here~~
A data.frame with variable and value labels stored as attributes using the convention
of \code{convertLabel}.
}
}
\value{
data frame.
}
\author{
Sebastian Weirich
}
\examples{
\dontrun{
dat <- foreign::read.spss("q:/BT2016/BT/32_Schulrückmeldungen/01_Input/Daten/Neue_Gadserstellung/BS_LV_Primar_2016_Matchingvorlaeufig_09_erweiterteGadsversion.sav",
       to.data.frame=FALSE, use.value.labels = FALSE, reencode = "65001")
dat <- convertLabel(dat)
atts<- createLabelList(dat)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }