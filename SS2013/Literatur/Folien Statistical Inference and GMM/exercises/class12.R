########################## Statistical Inference Winter 2011/12
########################## Class 12
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

#######################
#### Exercise 16.1 ####
#######################
  #################################################
  #### Omitted variables bias does not go away ####
  #################################################
  #1)
  #Input data and make it accessible
  omitted <- read.csv(file.choose(), sep=";", dec=",")
  x1 <- omitted$x1
  x2 <- omitted$x2
  x3 <- omitted$x3
  x4 <- omitted$x4
  y <- omitted$y
  n <- length(y)
  #Estimate by OLS without x4
  #Reminder: the true model is Y = 1 + 2X1 + 3X2 + 4X3 + 5X4
  # X1 is uncorrelated, X2&X3 are correlated and X3&X4, X2&X4 are uncorrelated
  mod <- lm(y~x1+x2+x3)
  summary(mod) #only the uncorrelated variable x1 is estimated well
  
  #2)
  ### 1.Alternative: Bootstrap the residuals
  uhat <- mod$residuals
  ahat <- coefficients(mod)[1]
  beta1hat <- coefficients(mod)[2]
  beta2hat <- coefficients(mod)[3]
  beta3hat <- coefficients(mod)[4]
  
  B <- 1000
  betastar <- matrix(NA,B,2)
  SEbetastar <- matrix(NA,B,2)
  for(b in 1:B) {
    ustar <- sample(uhat,n,replace=TRUE)
    ystar <- ahat+beta1hat*x1+beta2hat*x2+beta3hat*x3+ustar
    bootmod <- lm(ystar~x1+x2+x3)
    betastar[b,1] <- coefficients(bootmod)[3] #coef for x2
    betastar[b,2] <- coefficients(bootmod)[4] #coef for x3
    SEbetastar[b,1] <- sqrt(vcov(bootmod)[3,3]) #SE for x2
    SEbetastar[b,2] <- sqrt(vcov(bootmod)[4,4]) #SE for x3
  }
  
  # Calculate the bias
  print(colMeans(betastar)-c(beta2hat,beta3hat)) #omitted variable bias does not go away
  colMeans(SEbetastar)
  
  ### 2. Alternative: Bootstrap of the observations
  B <- 1000
  betastar <- matrix(NA,B,2)
  SEbetastar <- matrix(NA,B,2)
  for(b in 1:B) {
    indices <- sample(1:n,n,replace=TRUE)
    x1star <- x1[indices]
    x2star <- x2[indices]
    x3star <- x3[indices]
    ystar <- y[indices]
    bootmod <- lm(ystar~x1star+x2star+x3star)
    betastar[b,1] <- coefficients(bootmod)[3] #coef for x2
    betastar[b,2] <- coefficients(bootmod)[4] #coef for x3
    SEbetastar[b,1] <- sqrt(vcov(bootmod)[3,3]) #SE for x2
    SEbetastar[b,2] <- sqrt(vcov(bootmod)[4,4]) #SE for x3
  }
  
  # Calculate the bias
  print(colMeans(betastar)-c(beta2hat,beta3hat)) #omitted variable bias does not go away
  colMeans(SEbetastar)
 
#######################
#### Exercise 16.4 ####
#######################
  ######################################################################
  #### Bootstrap test for the Zipf index of city size distributions ####
  ######################################################################
  #1)
  library(AER)
  n <- 20
  R <- 1000
  y <- 1:n
  Z <- rep(NA,R)
  
  for (r in 1:R) {
    x <- sort(exp(rexp(n)),decreasing=TRUE)
    obj <- lm(log(y) ~ log(x))
    Z[r] <- coefficients(obj)[2]
  }
  truehist(Z)  
  
  #2)
  n <- 20
  R <- 1000
  y <- 1:n
  TT <- rep(NA,R)
  for (r in 1:R) {
    x <- sort(exp(rexp(n)),decreasing=TRUE)
    obj <- lm(log(y) ~ log(x))  
   TT[r] <- (coefficients(obj)[2]-1)/ sqrt(vcov(obj)[2,2])
  }
  truehist(TT)
  curve(dt(x,df=n-2),add=T)
  
  #3)
  # True data
  n <- 20
  alpha <- 1 #true value
  x <- sort(exp(rexp(n,rate=alpha)),decreasing=TRUE)
  y <- 1:n
  
  # Hypothetical value (here it is also the true value), Nullhypothesis
  alpha0 <- 1
  
  # Compute the test statistics for the true data
  obj <- lm(log(y)~log(x))
  alphahat <- coefficients(obj)[2]
  SEalphahat <- sqrt(vcov(obj)[2,2])
  Tstat <- (alphahat-alpha0)/SEalphahat #test statistic for true data
  
  # Approximate distribution through bootstrap
  B <- 1000
  Tsharp <- rep(NA,B)
  
  for(b in 1:B) {
    #draw a resample taking into account the nullhypothesis, alpha=alpha0=1
    #here it is also the true value
    xx <- sort(exp(rexp(n,rate=alpha0)),decreasing=TRUE)
    obj <- lm(log(y)~log(xx))
    alphasharp <- coefficients(obj)[2]
    SEalphasharp <- sqrt(vcov(obj)[2,2])
    Tsharp[b] <- (alphasharp-alpha0)/SEalphasharp    
    }
  
  # Sort the Tsharp values
  Tsharp <- sort(Tsharp)
  truehist(Tsharp)
  critlow <- Tsharp[0.025*B]
  crithigh <- Tsharp[0.975*B]
  
  if(Tstat<critlow | Tstat>crithigh) 
   print("Reject H0") else
   print("Don't reject H0")
  
#######################
#### Exercise 16.6 ####
#######################
  #################################
  #### The percentile-t-method ####
  #################################
  library(AER)
  # read data
  money <- read.csv(file.choose())
  m <- money$m
  r <- money$r
  y <- money$y
  TT <- length(m)

  yt <- y[5:TT]
  mt <- m[5:TT]; mt1 <- m[4:(TT-1)]; mt2 <- m[3:(TT-2)]
  rt <- r[5:TT]; rt1 <- r[4:(TT-1)]; rt2 <- r[3:(TT-2)]

  # Generalized IV estimation with confidence interval
  IV <- ivreg(mt~rt+yt+mt1+mt2|rt1+rt2+yt+mt1+mt2)
  summary(IV) 
  confint(IV,parm="rt",level=.95)
  
  # Bootstrap 0.95-percentile-t condfidence intervals 
  # estimate for original data
  rhat <- coefficients(IV)[2]
  SErhat <- sqrt(vcov(IV)[2,2])
  
  # Draw resamples
  B <- 1000
  Taustar <- rep(NA,B)
  for(b in 1:B) {
    indices <- sample(1:TT,TT,replace=TRUE)
    mtstar <- mt[indices]
    rtstar <- rt[indices]
    ytstar <- yt[indices]
    mt1star <- mt1[indices]
    mt2star <- mt2[indices]
    rt1star <- rt1[indices]
    rt2star <- rt2[indices]
    bootmod <- ivreg(mtstar~rtstar+ytstar+mt1star+mt2star|rt1star+rt2star+ytstar+mt1star+mt2star)
    SErstar <- sqrt(vcov(bootmod)[2,2])
    rstar <- bootmod$coefficients[2]
    Taustar[b] <- (rstar-rhat)/SErstar
  } 
  
  # Sort
  Taustar <- sort(Taustar)
  
  #Compute the interval
  low <- rhat-Taustar[0.975*B]*SErhat 
  high <- rhat-Taustar[0.025*B]*SErhat
  names(low)="2.5%"; names(high)="97.5%"
  CI <- c(low,high)
  
  print(CI) #CI using bootstrap
  confint(IV,parm="rt",level=.95) #CI using GIV estimation

  
#######################
#### Exercise 16.7 ####
#######################
  ###########################################
  #### *Heavy tails and variance testing ####
  ###########################################
  #1)
  library(AER)
  n <- 200
  R <- 1000
  Z <- rep(NA,R)
  for (r in 1:R) {
    X <- rt(n,df=3)
    Y <- rt(n,df=3)
    Z[r] <- var.test(X,Y)$p.value
  }  
  truehist(Z)
  length(Z[Z>.05])/R
  
  #2) Wald approch in accordance with the alternative hypothesis
  #true data
  n <- 200
  X <- rt(n,df=3)
  Y <- rt(n,df=3)
  Tstat <- var.test(X,Y)$statistic 
  R <- 1000
  Tstar <- rep(NA,R)
  for (r in 1:R) {
    XX <- sample(X,n,replace=T)
    YY <- sample(Y,n,replace=T)
    Tstar[r] <- var.test(XX,YY)$statistic
  }  
  Tstar <- sort(Tstar)
  critlow <- Tstar[0.025*R]
  crithigh <- Tstar[0.975*R]
  if(Tstat<critlow | Tstat>crithigh) print("Reject") else print("Do not reject")
  
