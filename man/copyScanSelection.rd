\name{copyScanSelection}
\alias{copyScanSelection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Copy booklet scan selection to desired directory}
\description{Functions allows to copy the scans of a selection of variables,
sort by variable codes, into a disired directory.}
\usage{
copyScanSelection ( vars, dat, id, sourceDir, targetDir, codebook,
    varColumn = "Variable", bookletColumnPrefix = "TH",
    separators = c("-", "_"), suffix = ".TIF")}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vars}{
%%     ~~Describe \code{file} here~~
character string of variables whose scans should be copied.
}
  \item{dat}{
%%     ~~Describe \code{file} here~~
wide format data which contain these variables.
}
  \item{id}{
%%     ~~Describe \code{file} here~~
column number or column name of the person identifier variable in the
wide format data.
}
  \item{sourceDir}{
%%     ~~Describe \code{file} here~~
The directory which contains the scans.
}
  \item{targetDir}{
%%     ~~Describe \code{file} here~~
The target directory for the copied scans.
}
  \item{codebook}{
%%     ~~Describe \code{file} here~~
data.frame of the IQB codebook
}
  \item{varColumn}{
%%     ~~Describe \code{file} here~~
character string of the variable identifier column name in the codebook.
}
  \item{bookletColumnPrefix}{
%%     ~~Describe \code{file} here~~
Character string of the booklet identifier prefix in the codebook. The codebook
usually contains several booklet columns which should begin with a common identifier.
}
  \item{separators}{
%%     ~~Describe \code{file} here~~
Character strings which separates booklet identifier and person identifier in the
filenames of the scans.
}
  \item{suffix}{
%%     ~~Describe \code{file} here~~
Suffix of the filenames of the scans.
}
}
\value{
No return, the files will be written on disk.
}
\author{
Sebastian Weirich
}
\examples{
\dontrun{
# source directory
path <- "R:/VERA3/Deutsch/V3_DEU_2020/1_Pilotierung_2019/14_Auswertung und Itemselektion/12_Itemselektion II/Zuhören/02_Scans_DidKomm/Daten/"
# target directory
target <- "N:/archiv/test"
# codebook
codebook <- data.frame ( read_excel(file.path(path, "V3-2016_Codebook_Zoowaerter.xlsx"),
            sheet = "Codebook"), stringsAsFactors = FALSE)
# variable list
vars <- read_excel(file.path(path, "KA3_Variablennamen_Zoowaerter.xlsx"), sheet = "Tabelle1")
vars <- unlist(vars)
# load data and reshape data to the wide format
load("r:/VERA3/Deutsch/V3_DEU_2016/1_Pilotierung_2015/13_Auswertung und Itemselektion/02_Itemebene.rda")
dat <- reshape2::dcast(datAggL, ID~item, value.var = "value")
# select and copy scans
cop  <- copyScanSelection(vars=vars, dat=dat, id="ID", sourceDir=path, targetDir=target,
        codebook=codebook)
}
}
