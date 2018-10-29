item.logit <- function(z,slope=1,thr)  {
  n <- length(z)
  k <- length(thr)
  m.zts <- matrix(rep(z*slope,k),ncol=k)
  m.thr <- matrix(rep(thr*slope,n),ncol=k,byrow=T)
  cum.prob  <- 1.0 / (1.0 + exp(-(m.zts - m.thr)))
  u <- matrix(rep(runif(n),k),ncol=k)
  x <- apply(u < cum.prob,1,sum)
  des <- cbind(-1*diag(k),rep(0,k))+cbind(rep(0,k),1*diag(k))
  prob <- cum.prob %*% des
  prob[,1] <- 1 + prob[,1]
  colnames(prob) <- c(paste("p",1:(k+1),sep=""))
  return(list(x=x,psc=prob))}
