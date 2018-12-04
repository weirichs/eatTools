\name{save.lmer.effects}
\alias{save.lmer.effects}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Save lme4-output to disc}
\description{The output of any lme4 analysis is saved in a memory saving manner.}
\usage{
save.lmer.effects ( lmerObj, lmerObjRestrict = NULL, fileName, scipen=6) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lmerObj}{
   An lme4 object to be saved.
   }
  \item{lmerObjRestrict}{
   Optional: a second (restricted) lme4 analysis output. Needs to be nested to the 
   first one. Intended if model copariison should be saved likewise. 
}
  \item{fileName}{
Name of the file for the output (without file extension). 
}
  \item{scipen}{
Maximum number of decimal places before exponential notation is used.
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
No output is returned to console. Two files are created in the desired directory. 
}
\author{
Sebastian Weirich
}

\examples{
\dontrun{
### Example from the help page of lmer().
fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
save.lmer.effects(fm1, fileName = "C:/fm1")

### with model comparison
### specify a "null model" nested in the first one: no fixed effects, only intercept
fm0 <- lmer(Reaction ~ (Days | Subject), sleepstudy)
save.lmer.effects(lmerObj = fm1, lmerObjRestrict = fm0, fileName = "C:/fm0_fm1")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
