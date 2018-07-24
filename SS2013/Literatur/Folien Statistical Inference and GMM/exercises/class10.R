########################## Statistical Inference Winter 2011/12
########################## Class 10
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

#######################
#### Exercise 15.1 ####
#######################
  ############################################
  #### Indirect Inference - AR(1) process ####
  ############################################
  library(AER)
  #Define function that estimates the ar process for different values of rho,n and R
  simestim <- function(rho,n,R) {
    Z <- matrix(NA,R,2)
    for (r in 1:R) {
      x <- filter(rnorm(n),rho,method="r",init=rnorm(1))
      Z[r,1]<- ar(x,aic=F,order = 1)$ar # method: yule-walker
      Z[r,2]<- ar(x,aic=F,order = 1, method = "ols")$ar #method: ols
    }
    return(Z)
  }
  
  #1) Stationary AR(1)
  stationary <- simestim(rho=0.99,n=100,R=1000)
  truehist(stationary[,1])
  truehist(stationary[,2])
  
  #2) Random Walk, methods: yule-walker, ols, mle
  randomwalk <- simestim(rho=1,n=100,R=1000)
  truehist(randomwalk[,1])
  truehist(randomwalk[,2])
  
  #3) Explosive AR(1)
  explosive <- simestim(rho=1.01,n=100,R=1000)
  truehist(explosive[,1])
  truehist(explosive[,2])
  
  #4) Estimation by indirect inference, auxiliary model is an AR(1)-process
  H <- 10; n <- 100; W <- diag(1)
  truedata <- filter(rnorm(n),0.9,method="r",init=rnorm(1)) #true model with rho=0.8
  thetahat <- ar(truedata,aic=F,order = 1)$ar #auxiliary model with true data
  thetahat <- as.matrix(thetahat)             #as matrix so you can compute Q
  
  ###########################################
  # Let's first do the steps for a single rho!
  rho <- 0.8
  thetahatsim <- rep(NA,H)
  for (h in 1:H){
    set.seed(123)
    simdata <- filter(rnorm(n),rho,method="r",init=rnorm(1)) #simulated data depending on beta
    thetahatsim[h] <- ar(simdata,aic=F,order = 1)$ar          #store estimator
  }
  thetatilde <- mean(thetahatsim)
  Q <- t(thetahat - thetatilde) %*% W %*% (thetahat - thetatilde)
  Q
  # We need to find the rho for which this sum is minimized
  ########################################################
      
  # So write a function that does the above steps for all rhos and finds the minimum
  
  f <- function(rho){
    thetahatsim <- rep(NA,H)
    set.seed(123)
    for (h in 1:H){
      simdata <- filter(rnorm(n),rho,method="r",init=rnorm(1)) #simulated data depending on beta
      thetahatsim[h] <- ar(simdata,aic=F,order = 1)$ar          #store estimator
    }
    thetatilde <- mean(thetahatsim)
    Q <- t(thetahat - thetatilde) %*% W %*% (thetahat - thetatilde)
    return(Q)
  }
  # indirect inference estimator for rho
  rhohat <- optimize(f,lower=0.7,upper=1.1)
  rhohat$minimum
  
  ############################################################
  #### Now let's put everything in a nice little function ####
  #### This is the short solution to the exercise         ####
  ############################################################
  rhohat <- function(truedata,H,n,W){
    thetahat <- ar(truedata,aic=F,order = 1)$ar #auxiliary model with true data
    thetahat <- as.matrix(thetahat)             #as matrix so you can compute Q
    
    f <- function(rho){
      thetahatsim <- rep(NA,H)
      set.seed(123)
      for (h in 1:H){
        simdata <- filter(rnorm(n),rho,method="r",init=rnorm(1)) #simulated data depending on beta
        thetahatsim[h] <- ar(simdata,aic=F,order = 1)$ar          #store estimator
      }
      thetatilde <- mean(thetahatsim)
      Q <- t(thetahat - thetatilde) %*% W %*% (thetahat - thetatilde)
      return(Q)
    }
    # indirect inference estimator for rho
    rhohat <- optimize(f,lower=0.7,upper=1.1)
    return(rhohat$minimum)   
  }
  
  rhohat(truedata,H=10,n=100,W=diag(1))
  
#######################
#### Exercise 15.2 ####
#######################
  #########################################################
  #### Indirect Inference - Ornstein-Uhlenbeck process ####
  #########################################################
  
  #1) Single path of an Ornstein-Uhlenbeck process
  install.packages("sde")
  library(sde)
  ?sde.sim #look at the example
  # Ornstein-Uhlenbeck
  drift <- expression(0.9*0 - 0.9 * x)
  sigma <- expression(1)
  X <- sde.sim(X0=2,drift=drift, sigma=sigma,N=100,T=100)
  plot(X,main="Ornstein-Uhlenbeck")
  # or specify model to generate data
  mu <- 0;  lambda <- 0.9; sigma <- 1
  X <- sde.sim(t0=0,T=100,X0=2, N=100,theta=c(lambda*mu,lambda,sigma),model="OU")
  plot(X,main="Ornstein-Uhlenbeck")
  
  #2) Estimation of discrete model
  library(AER)
  R <- 1000
  Z <- rep(NA,R)
  mu <- 0;  lambda <- 0.9; sigma <- 1
  
  for (r in 1:R){
    X <- sde.sim(t0=0,T=100,X0=2, N=100,theta=c(lambda*mu,lambda,sigma),model="OU")
    estim <- arima(X,order=c(1,0,0))
    Z[r] <- estim$coef[1]
  }
  
  truehist(Z) #histogram of 1-lambda, totally wrong
  truehist(1-Z) #histogram of lambda, totally wrong
  
  #3) Indirect inference estimation
  oupath <- read.table(file.choose(), header=T)
  truedata <- oupath$x
  plot(truedata,type="l")
  #Hint: The data generating process uses lambda=1.3; mu=9; sigma=3; T=N<-100
  
  OUIndirect <- function(truedata,H,W,startval){
    estim <- arima(truedata,order=c(1,0,0)) #auxiliary model with true data
    lambdahat <- 1-estim$coef[1]
    muhat <- estim$coef[2]/lambdahat
    sigmahat <- sqrt(estim$sigma2)
    thetahat <- rbind(lambdahat,muhat,sigmahat)
    
    f <- function(theta){
      thetahatsim <- matrix(NA,H,3)
      set.seed(123)
      for (h in 1:H){
        lambda <- theta[1]; mu <- theta[2]; sigma <- theta[3]
        simdata <- sde.sim(t0=0,T=100,X0=mu, N=100,theta=c(lambda*mu,lambda,sigma),model="OU") #simulated data depending on theta
        estimsim <- arima(simdata,order=c(1,0,0))         #store estimator
        lambdahatsim <- 1-estimsim$coef[1]
        muhatsim <- estimsim$coef[2]/lambdahatsim
        sigmahatsim <- estimsim$sigma2
        thetahatsim[h,1] <- lambdahatsim
        thetahatsim[h,2] <- muhatsim
        thetahatsim[h,3] <- sigmahatsim
      }
      thetatilde <- colMeans(thetahatsim)
      Q <- t(thetahat - thetatilde) %*% W %*% (thetahat - thetatilde)
      return(Q)
    }
    # optimize ove all thetas
    res <- optim(startval,f)
    return(res$par)   
  }
  
  OUIndirect(truedata=truedata,H=10,W=diag(3),startval=c(1.3,9,3))