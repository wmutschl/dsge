########################## Statistical Inference Winter 2011/12
########################## Class 9
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

library(gmm)
library(AER)
library(MASS)
###################
## Exercise 14.4 ##
###################
  library(AER)
  # read data, define vectors and matrices
  money <- read.csv(file.choose())
  View(money)
  m <- money$m
  r <- money$r
  y <- money$y
  TT <- length(m)

  yt <- y[5:TT]
  mt <- m[5:TT]; mt1 <- m[4:(TT-1)]; mt2 <- m[3:(TT-2)]
  rt <- r[5:TT]; rt1 <- r[4:(TT-1)]; rt2 <- r[3:(TT-2)]
  
  # Generalized IV estimation
  IV <- ivreg(mt~rt+yt+mt1+mt2|rt1+rt2+yt+mt1+mt2)
  IV

  # Gmm estimation in linear model notation
  obj <- gmm(g= mt~ rt+yt+mt1+mt2, x = ~ rt1+rt2+yt+mt1+mt2)
  obj
  summary(obj)

###################
## Exercise 14.5 ##
###################

  library(gmm)
  library(MASS)

  n <- 100
  x <- rt(n,df=3)/sqrt(3)
  u <- rt(n,df=3)/sqrt(3)
  y <- 0.9*x+u

  g <- function(theta,x) {
    beta <- theta[1]
    sigma <- theta[2]
    u <- x[,2]-beta*x[,1]
    m1 <- u
    m2 <- u*x[,1]
    m3 <- u^2-sigma^2
    return(cbind(m1,m2,m3))
  }
  # GMM estimates for beta and sigma
  obj <- gmm(g,cbind(x,y),t0=c(0.9,1),wmatrix="optimal")
  obj1 <- gmm(g,cbind(x,y),t0=c(0.9,1),wmatrix="ident")
  obj
  obj1
  
  # Whole thing within a loop
  R <- 1000 
  n <- 100 # or try n=1000
  nu <- 30
  Z <- matrix(NA,R,2)
  for(r in 1:R) {
    x <- rt(n,df=nu)/sqrt(nu/(nu-2))
    u <- rt(n,df=nu)/sqrt(nu/(nu-2))
    y <- 0.9*x+u
    obj <- gmm(g,x=cbind(x,y),t0=c(0.9,1),wmatrix="optimal")
    Z[r,] <- (coefficients(obj)-c(0.9,1))/sqrt(diag(vcov(obj)))
    }
  # mean of the estimates for beta and sigma
  apply(Z,2,mean) 
  #histogram of sigma compared to a normal distribution
  truehist(Z[,2])
  xx <- seq(min(Z[,2]),max(Z[,2]),length=500)
  lines(xx,dnorm(xx,mean(Z[,2]),sd(Z[,2])))  

  ###Now with the normal distribution
  R <- 1000 # or try R=1000
  n <- 100 # or try n=1000
  Z <- matrix(NA,R,2)
  for(r in 1:R) {
    x <- rnorm(n)
    u <- rnorm(n)
    y <- 0.9*x+u
    obj <- gmm(g,cbind(x,y),t0=c(0.9,1),wmatrix="optimal")
    Z[r,] <- (coefficients(obj)-c(0.9,1))/sqrt(diag(vcov(obj)))
    }
  # mean of the estimates for beta and sigma
  apply(Z,2,mean) 
  
  #histogram of sigma compared to a normal distribution
  truehist(Z[,2])
  xx <- seq(min(Z[,2]),max(Z[,2]),length=500)
  lines(xx,dnorm(xx,mean(Z[,2]),sd(Z[,2])))

###################
## Exercise 14.6 ##
###################
  #Get data
  data(Finance)
  ?Finance
  View(Finance)
  #let's only take the first 500 observations
  r <- Finance[1:500,1:5]
  rm <- Finance[1:500,"rm"]
  
  #Define moment conditions
  g <- function(param,dat){
    R <- 1+dat[,1:5]
    Rm <- 1+ dat[,6]
    m <- (param[1]+param[2]*Rm)*R-1
    return(m)
  }
  
  #estimate GMM
  obj <- gmm(g,x=cbind(r,rm),c(0,0)) #this gives you an error
  mode(r) # problem is in the data: r is a list and not numeric. gmm needs numeric data
  mode(rm) # rm is numeric
  mode(cbind(r,rm)) #if we combine the data, we still get a list
  X <- as.matrix(cbind(r,rm)) #so let's convert it into a numeric structure
  mode(X)
  obj <- gmm(g,x=X,c(0,0))
  obj
  summary(obj)
  
  # Test of overidentifying restrictions
  specTest(obj) #confirms the non-rejection of the theory
  
###################
## Exercise 14.7 ##
###################
  #Load Data
  consumptiondata <- read.csv(file.choose(), sep=";", dec=",")
  dax30ann <- read.csv(file.choose())
  View(consumptiondata)
  View(dax30ann)
  V7 <- consumptiondata$V7
  dax30 <- dax30ann$dax30
  
  #growth rates for consumption
  gr1 <- V7[2:22]/V7[1:21]
  gr2 <- V7[24:42]/V7[23:41]
  gr <- c(gr1,gr2)
  #gross return of DAX
  R <- dax30[3:42]/dax30[2:41]
  #Matrix of data
  X <- cbind(gr,R)
  
  g <- function(param,dat){
    gr <- dat[,1]
    R <- dat[,2]
    m <- param[1]*(gr^(-param[2]))*R-1 #the result is sensible to the second parameter, i.e. how you use the minus-sign
    m <- m[-length(m)] #since m has one more entry than z, get rid of the last one
    z <- cbind(1,gr[-1],R[-1])
    return(m*z)
  }
  obj <- gmm(g,x=X,c(1,1))
  obj  #very bad results for gamma
  