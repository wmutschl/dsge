########################## Statistical Inference Winter 2011/12
########################## Class 4
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

##################
### Exercise 9 ###
##################

################
# Exercise 9.1 #
################
    #1)
    z <- rep(NA,1000); u <- rep(NA,1000); g <- rep(NA,1000)
    for (i in 1:1000) {
      z[i] <- mean(rnorm(i,mean=10,sd=2))
      u[i] <- mean(runif(i,min=0,max=1)) #expectation is (a+b)/2
      g[i] <- mean(rgeom(i,prob=0.2)) #expectation is (1-p)/p          
    }
    
    par(mfrow=c(1,2))
    
    truehist(z,main="Law of large numbers")
    plot(z, main="for the normal distribution"); abline(h=10,lwd=2,col="red")
    
    truehist(u,main="Law of large numbers")
    plot(u,main="for the uniform distribution"); abline(h=0.5,lwd=2,col="red")
    
    truehist(g,main="Law of large numbers")
    plot(g,main="for the geometric distribution"); abline(h=4,lwd=2,col="red")
 
    #2)
    z <- rep(NA,1000)
    rho=0.8
    mu=2
    for (i in 1:1000) {
      z[i] <- mean(filter((1-rho)*mu+rnorm(i,sd=2),rho,method="recursive",init=(1-rho)*mu)) #try and use another distribution
    }
    par(mfrow=c(1,2),pty="s")
    truehist(z,main="Law of large numbers")
    plot(z, main="for intertemporal dependence AR(1)"); abline(h=mu,lwd=2,col="red")
    
################
# Exercise 9.2 #
################
    #1)
    z <- rep(NA,1000)
    for (i in 1:1000) {
      #x <- rnorm(i,mean=10,sd=2) ; variance <- 2^2
      #x <- runif(i,min=0,max=6) ; variance <- 3
      x <- rgeom(i,prob=0.2); variance <-20
      z[i] <- sum((x-mean(x))^2)/i
    }
    
    par(mfrow=c(1,2))
    
    truehist(z,main="Law of large numbers")
    plot(z, main="for the variance"); abline(h=variance,lwd=2,col="red")
    
    #2)
    z <- rep(NA,1000)
    for (i in 1:1000) {
      x <- rt(i,df=3)
      z[i] <- sum((x-mean(x))^2)/i; variance <-3/(3-2)
    }
    
    par(mfrow=c(1,2))
    
    truehist(z,main="Law of large numbers")
    plot(z, main="for the variance");abline(h=variance,lwd=2,col="red")

################
# Exercise 9.3 #
################

  #1) Illustration of the central limit theorem for the uniform distribution with sigma as the standard deviation
    library(AER)
    N <- 10000
    expect <- 0.5
    vari <- 1/12
    par(mfrow = c(1,2),pty = "s")
    for(n in 1:20) {
      X <- runif(N*n) #N*n random numbers
      M <- matrix(X, N, n) #matrix of N rows and n columns filled with random numbers
      Yn <- rowSums(M) # calculate the mean of n random numbers for N rows
      Zn <- (Yn/n - expect)*sqrt(n/vari) #standardization: subtract the expectation and divide by the standard deviataion, times the square root of the numbers used to calculate the mean
      #display the sequence of random variables
      truehist(Zn, xlim = c(-4,4),ylim = c(0,0.5), main = paste("n =", toString(n),sep =" "))
      coord <- par("usr") # vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
      x <- seq(coord[1], coord[2], length.out = 500)
      lines(x, dnorm(x), col = "red")
      qqnorm(Zn, ylim = c(-4,4), xlim = c(-4,4), pch = ".", col = "blue")
      abline(0, 1, col = "red")
      Sys.sleep(1)
    }

  #2) Illustration of the central limit theorem for the uniform distribution with the estimated standard deviation
    library(AER)
    N <- 10000
    expect <- 0.5
    par(mfrow = c(1,2),pty = "s")
    for(n in 2:20) {   #hint: it needs to start with n=2, for n=1 you get vari=0 and you cannot divide by 0
      X <- runif(N*n) #N*n random numbers
      M <- matrix(X, N, n) #matrix of N rows and n columns filled with random numbers
      vari <- 1/n * rowSums((M-rowMeans(M))^2)
      Yn <- rowSums(M) # calculate the mean of n random numbers for N rows
      Zn <- (Yn/n - expect)*sqrt(n/vari) #standardization: subtract the expectation and divide by the standard deviataion, times the square root of the numbers used to calculate the mean
      #display the sequence of random variables
      truehist(Zn, xlim = c(-4,4),ylim = c(0,0.5), main = paste("n =", toString(n),sep =" "))
      coord <- par("usr") # vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
      x <- seq(coord[1], coord[2], length.out = 500)
      lines(x, dnorm(x), col = "red")
      qqnorm(Zn, ylim = c(-4,4), xlim = c(-4,4), pch = ".", col = "blue")
      abline(0, 1, col = "red")
      Sys.sleep(1)
    }
    
  #3)
  #ar process
    #x1 = arima.sim(list(order=c(1,0,0), ar=.9), n=100,innov=epsilon,n.start=1,start.innov=0)  
    N <- 10000
    mu <- 0.5
    rho=0.8
    sigma <- 2 #this is the standard deviation of the random term in the AR(1) process
    vari <- sigma^2/(1-rho^2)
    par(mfrow = c(1,2),pty = "s")
    for(n in 1:20) {
      X <- filter((1-rho)*mu+rnorm(n*N,sd=sigma),rho,method="recursive",init=(1-rho)*mu) #N*n random numbers
      M <- matrix(X, N, n) #matrix of N rows and n columns filled with random numbers
      Yn <- rowSums(M) # calculate the mean of n random numbers for N rows
      Zn <- (Yn/n - mu)*sqrt(n/vari) #standardization: subtract the expectation and divide by the standard deviataion, times the square root of the numbers used to calculate the mean
      #display the sequence of random variables
      truehist(Zn, xlim = c(-4,4),ylim = c(0,0.5), main = paste("n =", toString(n),sep =" "))
      coord <- par("usr") # vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
      x <- seq(coord[1], coord[2], length.out = 500)
      lines(x, dnorm(x), col = "red")
      qqnorm(Zn, ylim = c(-4,4), xlim = c(-4,4), pch = ".", col = "blue")
      abline(0, 1, col = "red")
      Sys.sleep(1)
    }
  
  #4)
    library(AER)
    N <- 10000
    expect <- 0
    par(mfrow = c(1,2),pty = "s")
    for(n in 2:20) {   #hint: it needs to start with n=2, for n=1 you get vari=0 and you cannot divide by 0
      X <- rt(N*n,df=1.5) #N*n random numbers
      M <- matrix(X, N, n) #matrix of N rows and n columns filled with random numbers
      vari <- 1/n * rowSums((M-rowMeans(M))^2)
      Yn <- rowSums(M) # calculate the mean of n random numbers for N rows
      Zn <- (Yn/n - expect)*sqrt(n/vari) #standardization: subtract the expectation and divide by the standard deviataion, times the square root of the numbers used to calculate the mean
      #display the sequence of random variables
      truehist(Zn, xlim = c(-4,4),ylim = c(0,0.5), main = paste("n =", toString(n),sep =" "))
      coord <- par("usr") # vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
      x <- seq(coord[1], coord[2], length.out = 500)
      lines(x, dnorm(x), col = "red")
      qqnorm(Zn, ylim = c(-4,4), xlim = c(-4,4), pch = ".", col = "blue")
      abline(0, 1, col = "red")
      Sys.sleep(1)
    }


################
# Exercise 9.6 #
################
  graphics.off()
  library(AER)
  I <- 1000
  n <- 100
  M <- rep(NA,I)
  R <- rep(NA,I)
  for (i in 1:I) {
    x <- rt(n,df=1.5)
    M[i] <- max(x)
    R[i] <- M[i]/qt(1-1/i,1.5)
  }
  truehist(R)
  coord <- par("usr")
  x <- seq(coord[1],coord[2],length=500)
  lines(x,1.5*x^(-2.5)*exp(-x^(-1.5)))
    
#################
# Exercise 11.6 #
#################
  # Moment estimator for pareto distribution
  install.packages("VGAM") # in order to get the pareto distribution
  library(VGAM)
  library(AER)
  
  a <- 4.5 #shape parameter
  K <- 1 #location parameter
  R <- 10000 #index for for loop
  n <- 100 # number of random variables
  ahat <- rep(NA,R) # initialize estimator
  ahat1 <- rep(NA,R) # initialize estimator
  
  for (i in 1:R) {
    x <- rpareto(n,location=K,shape=a) #generate n random variables
    ahat[i] <- mean(x)/(mean(x)-1) #moment estimator of alpha if K is known
    ahat1[i] <- 1+sqrt(1+mean(x)^2/var(x)) #moment estimator of alpha if K is unknown
  }
  #graphical output
  par(mfrow=c(1,2))
  truehist(ahat)
  g <- seq(min(ahat),max(ahat),length=300)
  lines(g,dnorm(g,mean(ahat),sd(ahat)))
  truehist(ahat1)
  h <- seq(min(ahat1),max(ahat1),length=300)
  lines(h,dnorm(h,mean(ahat1),sd(ahat1)))

#################
# Exercise 11.7 #
#################
  # Moment estimator for uniform distribution
  a <- 0
  b <- 1
  R <- 10000
  n <- 40
  ahat <- rep(NA,R)
  bhat <- rep(NA,R)
  minx <- rep(NA,R)
  for (r in 1:R) {
    x <- runif(n,a,b)
    ahat[r] <- mean(x)-sqrt(3*var(x))
    bhat[r] <- mean(x)+sqrt(3*var(x))
    minx[r] <- min(x)
  }
  par(mfrow=c(2,1))
  
  truehist(ahat)
  g <- seq(min(ahat),max(ahat),length=300)
  lines(g,dnorm(g,mean(ahat),sd(ahat)))
  
  truehist(bhat)
  h <- seq(min(bhat),max(bhat),length=300)
  lines(h,dnorm(h,mean(bhat),sd(bhat)))
  
  print("Proportion of impossible estimates:")
  print(sum(minx<ahat)/R)
