########################## Statistical Inference Winter 2011/12
########################## Class 8
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de


###################
## Exercise 13.7 ##
###################
  library(AER)
  # read data, define vectors and matrices
  money <- read.csv(file.choose())
  View(money)
  m <- money$m
  r <- money$r
  y <- money$y
  TT <- length(m)
  # Matrix of regressors
  X <- cbind(1,r[5:TT],y[5:TT],m[4:(TT-1)],m[3:(TT-2)])
  # Matrix of Instruments
  W <- cbind(1,r[4:(TT-1)], r[3:(TT-2)],y[5:TT], m[4:(TT-1)], m[3:(TT-2)])
  # Projection-matrix
  Pw <- W %*% solve( t(W)%*%W ) %*% t(W)
  
  #1)
  OLS <- lm(m[5:TT] ~ r[5:TT] + y[5:TT] + m[4:(TT-1)] + m[3:(TT-2)])
  summary(OLS)
    
  # Durbin-Wu-Hausman test
  WuRegr <- lm(m[5:TT] ~ Pw%*%r[5:TT] + y[5:TT] + m[4:(TT-1)] + m[3:(TT-2)])
  summary(WuRegr)
  # H0 can be rejected.
  # If r_t-1 and r_t-2 are appropriate instruments for r_t,
  # then the OLS estimator is not consistent, but the IV-estimator is! 
  # Hence, r_t should not be treated as exogenous!
  
  #2)
  IV <- ivreg(m[5:TT] ~ r[5:TT] + y[5:TT] + m[4:(TT-1)] + m[3:(TT-2)]|r[4:(TT-1)]+ r[3:(TT-2)] + y[5:TT] + m[4:(TT-1)] + m[3:(TT-2)])
  summary(IV)
  #You can get the same coefficients, if you simply use the Formula
  betaGIV <- solve(t(X)%*%Pw%*%X)%*%t(X)%*%Pw%*%m[5:TT]
  betaGIV
  
  # compare to OLS coefficients:
  OLS$coefficients
  IV$coefficients
  
  # Test if the coefficient is the same
  covmat <- IV$sigma^2*IV$cov
  linearHypothesis(IV,paste("r[5:TT]=",OLS$coefficients[2]),V=covmat) # H0 can not be rejected
 
  #3)
  u <- residuals(IV)
  n <- length(u)
  #perform OLS and store the results
  obj <- summary(lm(u ~ r[4:(TT-1)] + r[3:(TT-2)] + y[5:TT] + m[4:(TT-1)] + m[3:(TT-2)]))
  teststat <- n*obj$r.squared 
  1-pchisq(teststat,df=1) # p-value
  #Nullhypothesis can be rejected, the model is thus not overidentified.
  
  
###################
## Exercise 14.1 ##
###################

  install.packages("gmm")
  library(gmm)
  
  #three moment conditions
  g1 <- function(param,x) {
    m1 <- param[1]-x
    m2 <- param[2]^2-(x-param[1])^2
    m3 <- x^3 - param[1]*(param[2]^2+3*param[2]^2)
    f <- cbind(m1,m2,m3)
    return(f)
  }
  
  #two moment conditions
  g2 <- function(param,x) {
    m1 <- param[1]-x
    m2 <- param[2]^2-(x-param[1])^2
    f <- cbind(m1,m2)
    return(f)
  }
  
  #generate data
  set.seed(123)
  n <- 200
  dat <- rnorm(n,mean=4,sd=2)
  
  #with three moment conditions
  res1 <- gmm(g1,dat,c(mu=0,sig=0))
  print(res1)
  summary(res1)
  
  #with two moment conditions
  res2 <- gmm(g2,dat,c(mu=0,sig=0))
  print(res2)
  summary(res2)
  
###################
## Exercise 14.2 ##
###################
  
  #Let's first have a quick look at the linear regression model
  ######### Benchmark OLS #########
  
  x1 <- rnorm(100)
  x2 <- rnorm(100)
  u <- rnorm(100)
  y <- 1+2*x1+1*x2+u
  
  lm(y~x1+x2)
  #THIS WORKS and gives you the OLS estimate
  gmm(y~x1+x2,x=~x1+x2,c(0,0,0))
    
  #THIS WORKS TOO! And is more general
  g3 <- function(param,dat){
    y <- dat[,1]
    x0 <- dat[,2]
    x1 <- dat[,3]
    x2 <- dat[,4]
    m <- y -param[1]*x0 - param[2]*x1 - param[3]*x2
    return(cbind(x0,x1,x2)*m)
  }
  gmm(g3,x=cbind(y,1,x1,x2),c(Constant=1,Beta1=2,Beta2=1))
  
  #Now let's consider the nonlinear regression model
  ######### Nonlinear regression model #########
  expgrowth <- read.csv(file.choose())
  View(expgrowth)
  x <- expgrowth$x
  y <- expgrowth$y
 
  g4 <- function(param,dat){
    y <- dat[,1]
    x <- dat[,2]
    f1 <- y - exp(param[1]+param[2]*x)
    m1 <- cbind(1,x)*f1
    f2 <- (y-exp(param[1]+param[2]*x))^2-param[3]^2
    m2 <- f2
    return(cbind(m1,m2))
  }
  
  g4(c(1,0.1,1),cbind(y,x)) # g gives you a nxq matrix with n observations and q moment functions
  gmmmod <- gmm(g4,x=cbind(y,x),c(alpha=0,beta=0.01,sigma=1))
  print(gmmmod)
  gmmmod <- gmm(g4,x=cbind(y,x),c(alpha=2,beta=0.01,sigma=2))
  print(gmmmod$coefficients) #depends on the start-values, in order to be more precise one could specify the gradient as well (see documentation how to do it)
  summary(gmmmod)

