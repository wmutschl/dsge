########################## Statistical Inference Winter 2011/12
########################## Class 5
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

#####################
### Exercise 12.1 ###
#####################
  library(AER)
  library(VGAM)

  daxreturns <- read.csv(file.choose(), sep=";", dec=",")
  View(daxreturns)
  attach(daxreturns)
  plot(daxret)
  z <- daxret*(-1)
  z<2
  z>=2
  daxlosses <- z[z>=2]
  alphahat <- length(daxlosses)/(sum(log(daxlosses) - log(2)))
  
  plot(daxlosses)
  truehist(daxlosses)
  hist(daxlosses,prob=T)
  coord <- par("usr")
  x <- seq(coord[1], coord[2], length.out = length(daxlosses))
  lines(x,dpareto(x,location=2,shape=alphahat),col="red",lwd=2)
  
  #Likelihood of the observations as a function of alpha
  likelihood <- function(alpha,K,x) {
    z <- prod(dpareto(x,K,alpha))
    return(z)
  }
  loglikelihood <- function(alpha,K,x) {
    n <- length(x)
    z <- n*(log(alpha)+alpha*log(K)) - (alpha+1)*sum(log(x))
    return(z)
  }
  
  alpha <- seq(0,10,length.out=100)
  plot(alpha,loglikelihood(alpha,2,daxlosses))
  
  abline(v=alphahat)
  f <- function(x) -likelihood(x,2,daxlosses)
  optimize(f,lower=0,upper=3)
  
#####################
### Exercise 12.2 ###
#####################  

  R <- 10000
  n <- 100
  a <- 3
  b <- 6
  ahat <- numeric(R)
  bhat <- numeric(R)
  for (r in 1:R) {
    x <- runif(n,min=a,max=b)
    ahat[r] <- min(x)
    bhat[r] <- max(x) 
  }
  par(mfrow=c(1,2))
  hist(ahat,prob=T)
  hist(bhat,prob=T)
  
#####################
### Exercise 12.3 ###
#####################  
  # Definition of loglikelihood
  logl <- function(param,dat,cens) {
    mu <- param[1]
    sigma <- param[2]
    y <- dat
    c <- cens
    return(-sum(log(dlnorm(y[y<c],meanlog=mu,sdlog=sigma))) - sum(log(1-plnorm(y[y==c],meanlog=mu,sdlog=sigma))))
  }
  
  # Get data
  censoredln <- read.table(file.choose(), header=T, quote="\"")
  attach(censoredln)
  x <- censoredln$x #if attach doesn't work
  f <- function(x) x^2
  
  # Optimization
  obj <- optim(c(0,1),logl,dat=x,cens=12,hessian=T)
  print(obj$par)  # Point estimates
  print(solve(obj$hessian)) # Numerical covariance matrix
  