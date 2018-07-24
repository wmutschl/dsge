########################## Statistical Inference Winter 2011/12
########################## Class 6
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

###################
### Exercise 12 ###
###################

## Exercise 12.4 ##
  # Get data
  expgrowth <- read.csv(file.choose())
  View(expgrowth)

  #1: Definition of negative loglikelihood
  logl <- function(param,dat){
    a <- param[1]
    b <- param[2]
    sigma <- param[3]
    x <- dat[,2]
    y <- dat[,1]
    u <- y-exp(a+b*x)
    z <- sum(log(dnorm(u,mean=0,sd=sigma)))
    zz <- sum(log(dnorm(y,mean=exp(a+b*x),sd=sigma))) #works as well
    return(-z)
  }
  
  #2: Numerical Optimization
  
  #Test on artifical data
  a <- 1; b<-.02; sigma <- 1
  u <- rnorm(100,mean=0,sd=sigma)
  x <- expgrowth[,2]
  y <- exp(a+b*x)+u
  artdata <- matrix(c(y,x),ncol=2)
  obj <- optim(c(0,0.02,1),logl,dat=artdata,hessian=T)
  obj$par
  
  # Use it on the data
  # Optimization, for start values one has to consider that the exponential function is very
  # sensitive to the parameters a and b -> use small ones
  obj <- optim(c(0,0.1,1),logl,dat=expgrowth,hessian=T)
  print(obj$par)  # Point estimates
  
  #3: Asymptotic numerical covariance matrix
  print(solve(obj$hessian))
  
  #4: An exponential density function for the error terms
  #Definition of negative loglikelihood
  logl2 <- function(param,dat){
    a <- param[1]
    b <- param[2]
    x <- dat[,2]
    y <- dat[,1]
    u <- y-exp(a+b*x)
    z <- -n*log(2) - sum(abs(u))     #analytically
    zz <- sum(log(0.5*exp(-abs(u)))) #alternatively
    return(-z) #or return(-zz)
  }
  obj2 <- optim(c(0,0.1,1),logl2,dat=expgrowth,hessian=T)
  print(obj2$par)  # Point estimates