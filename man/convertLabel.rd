\name{convertLabel}
\alias{convertLabel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform SPSS variable and value labels into ZKD convention.}
\description{By default, 'read.spss' from the foreign package uses variable.labels
as attributes of the whole data.frame, value.labels as attribute of each specific 
variable in the data.frame. \code{convertLabel} provides variable and value 
labels as variable attributes.}
\usage{
convertLabel(spssList , stringsAsFactors = TRUE, useZkdConvention = TRUE, 
replaceSpecialSigns = TRUE)}  
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{spssList}{
%%     ~~Describe \code{file} here~~
An object created by 'read.spss'. Important: Using 'read.spss', \code{to.data.frame} has 
to be FALSE.
}
  \item{stringsAsFactors}{
%%     ~~Describe \code{file} here~~
Transform character variables into factors?
}
  \item{useZkdConvention}{
%%     ~~Describe \code{file} here~~
Logical: Use ZKD convention, i.e. variable.labels are named 'varLabel', value.labels 
are named 'valLabel'.
}
  \item{replaceSpecialSigns}{
%%     ~~Describe \code{file} here~~
Logical: Replace special signs (non-ASCII characters)?
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
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
