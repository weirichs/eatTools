\name{get.lmer.effects}
\alias{get.lmer.effects}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
extract results
}
\description{
Extract results from an object created by \sQuote{lmer} or \sQuote{glmer} from 
the \sQuote{lme4} package. 
}
\usage{
get.lmer.effects ( lmerObj , bootMerObj = NULL, conf = .95, saveData = FALSE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lmerObj}{An object of class \sQuote{merMod} or \sQuote{glmerMod}, as created by 
  \sQuote{lmer} or \sQuote{glmer} from the \sQuote{lme4} package. }
  \item{bootMerObj}{Optional: An object of S3 class \sQuote{boot}, as created by \sQuote{bootMer}.
  Applies if standard error and/or confidence intervals from a bootstrap should be augmented 
  to the lme4 results object. }
  \item{conf}{Applies if confidence intervals from a bootstrap should be augmented to the lme4 
  results object. Define the upper bound of the confidence interval.}
  \item{saveData}{Logical: Should the data frame be attached to the output as an attribut?}
}
%% \details{}
\value{
A data frame with at least 10 columns comprising the results of the GLMM analysis. 
\item{model}{The name of the object the analysis results are assigned to.}
\item{source}{The lmer-function called}
\item{var1}{First variable name}
\item{var2}{Second variable name}
\item{type}{Type of variable and/or derived parameter}
\item{group}{The group a model parameter belongs to}
\item{par}{Name of the model parameter}
\item{derived.par}{Second name of the model parameter}
\item{var2}{Second variable name}
\item{value}{Corresponding numerical value}
Note: In principle, \code{get.lmer.effects} collects only output already contained in the 
lme4-output. Additionally, the marginal and conditional r-squared from Nakagawa and 
Schielzeth (2013) is provided. The parameters are labeled \sQuote{R2_m} and \sQuote{R2_c}
in the \code{par}-column.
}
%% \references{}
\author{
Sebastian Weirich
}
\examples{
library ( lme4 )
### First example: GLMM analysis
fmVA <- glmer( r2 ~ Anger + Gender + btype + situ + (1|id) + (1|item), family = binomial, data = VerbAgg)
results    <- get.lmer.effects ( fmVA ) 

### second example: obtain standard errors and confidence intervals from the model estimated 
### in the first example via bootstrap (using only 5 bootstrap samples for illustration)
### We use the 'bootMer' function fom the lme4 package  
fmVAB<- bootMer(x = fmVA, FUN = get.lmer.effects.forBootMer, nsim = 5)
resultsBoot<- get.lmer.effects ( lmerObj = fmVA, bootMerObj = fmVAB, conf = .95, saveData = FALSE) 
}