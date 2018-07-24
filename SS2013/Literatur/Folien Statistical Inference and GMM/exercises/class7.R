########################## Statistical Inference Winter 2011/12
########################## Class 7
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

###################
## Exercise 13.2 ##
###################

  #1)
  library(MASS)
  library(AER)
  
  # Generate data: both exogenous variables are correlated with u
  Omega <- matrix(c(
  2,0.3,0.5,0.7,
  0.3,1,0.5,0.7,
  0.5,0.5,1,0,
  0.7,0.7,0,1),nrow=4,ncol=4)
  
  n <- 100
  dat <- mvrnorm(n,c(5,5,0,5),Omega)
  x1 <- dat[,1]
  x2 <- dat[,2]
  u <- dat[,3]
  w <- dat[,4] # instrument
  y <- 1+2*x1+3*x2+u
  obj <- ivreg(y~x1+x2|w) #does not work
  
  #2)
  R <- 1000
  Z <- matrix(NA,nrow=R,ncol=3)
  ZZ <- matrix(NA,nrow=R,ncol=3)
  for(r in 1:R) {
    dat <- mvrnorm(n,c(5,5,0,5),Omega)
    x1 <- dat[,1]
    x2 <- dat[,2]
    u <- dat[,3]
    w <- dat[,4] # instrument
    y <- 1+2*x1+3*x2+u
  
    #OLS is inconsistent
    ols <- lm(y~x1+x2)
    
    # IV from AER-package
    w2 <- w^2
    w3 <- w^3
    obj <- ivreg(y~x1+x2|w2+w3)
    
    #store estimates
    Z[r,] <- coefficients(obj)
    ZZ[r,] <- coefficients(ols)
    }
  
  print(apply(Z,2,median))
  print(apply(Z,2,mean))
  print(apply(Z,2,sd))
  
  print(apply(ZZ,2,median))
  print(apply(ZZ,2,mean))
  print(apply(ZZ,2,sd))
  
  par(mfrow=c(3,1))
  truehist(Z[,1])
  truehist(Z[,2])
  truehist(Z[,3])
  
###################
## Exercise 13.4 ##
###################

  library(foreign)
  library(AER)
  graphics.off()
  
  #1) Replicate Figure I and II
    x <- read.dta(file.choose())
    View(x)
    dob <- x$yob+(x$qob-1)*0.25
    
    # Figure I
    Z <- matrix(NA,40,2)
    Z[,1] <- seq(1930,1939.75,by=0.25)
    for(i in 1:dim(Z)[1]) {
      Z[i,2] <- mean(x$educ[dob==Z[i,1]])
    }
    plot(Z,t="o",main="Figure I",xlab="Year of Birth",ylab="Years of Completed Education",ylim=c(12.2,13.2))
    
    # Figure II
    Z <- matrix(NA,40,2)
    Z[,1] <- seq(1940,1949.75,by=0.25)
    for(i in 1:dim(Z)[1]) {
      Z[i,2] <- mean(x$educ[dob==Z[i,1]])
    }
    plot(Z,t="o",main="Figure II",xlab="Year of Birth",ylab="Years of Completed Education",ylim=c(13,13.9))
    
  #2) Replicate Figure V
    Z <- matrix(NA,80,2)
    Z[,1] <- seq(1930,1949.75,by=0.25)
    for(i in 1:dim(Z)[1]) {
      Z[i,2] <- mean(x$lwklywge[dob==Z[i,1]])
    }
    plot(Z,t="o",main="Figure V",xlab="Year of Birth",ylab="Log Weekly Earnings")
      
  #3) Replicate column 1 of table IV
    # Backup data
    backup <- x
    # Drop all persons born after 1929Q4
    x <- x[x$yob<1930,]
    dob <- x$yob+(x$qob-1)*0.25
    
    # Create yob dummies
    Dyear <- factor(x$yob)
    
    # Column (1)
    regr <- lm(x$lwklywge ~ x$educ + Dyear)
    summary(regr)
    
  #4) Replicate column 3 of table IV
    age <- 1970-dob
    # Column (3)
    regr <- lm(x$lwklywge~x$educ+Dyear+age+I(age^2))
    summary(regr)
  
  #5) Replicate column 2 of table IV
    Dq <- dob
    Dq[Dq-floor(Dq)==0.75] <- 0
    Dq <- factor(Dq)
    # Column (2)
    regr <- ivreg(x$lwklywge~x$educ+Dyear|Dq+Dyear)
    summary(regr)
    
  #6) Replicate column 4 of table IV
    # Column (4)
    regr <- ivreg(x$lwklywge~x$educ+age+I(age^2)+Dyear|Dq+Dyear)
    summary(regr)
  
###################
## Exercise 13.6 ##
###################
  library(AER)
  fertility <- read.csv2(file.choose())
  View(fertility)
  attach(fertility)
  #1)
    n <- dim(fertility)[1] #number of families
    x <- fertility[morekids==1,] # only families that had another child
    m <- dim(x)[1] #number of families that had another child
    dim(x[x$samesex==1,])[1]/m
    dim(x[x$samesex==0,])[1]/m
  
  #2)
    regr <- lm(weeksm1 ~ morekids + boy1st + boy2nd + agem1 + black + hispan + othrace)
    summary(regr)
    
  #3)
    #Relevance of instrument
    relevInst <- lm(morekids ~ samesex)
    summary(relevInst) # F-Statistic is high!
  
  #4)
    ivmod <- ivreg(weeksm1 ~ morekids+boy1st + boy2nd + agem1 + black + hispan + othrace|samesex + boy1st + boy2nd + agem1 + black + hispan + othrace)
    summary(ivmod)
  
  #5) t-test that two coefficients are equal
    covmat <- ivmod$sigma^2*ivmod$cov
    betaHisp <- ivmod$coefficients[7]
    betaOthr <- ivmod$coefficients[6]
    varHisp <- covmat[7,7]
    varOthr <- covmat[6,6]
    ttest <- (betaHisp -betaOthr)/sqrt(varHisp + varOthr)
    abs(ttest) > 2.56 # reject H0 at least on a 1% level!
    1-pt(abs(ttest),n-7) #p-value is zero!
    
  #6)
  betahat <- ivmod$coefficients[c(3,4,7)]
  beta0 <- c(0,0,0)
  ivmod0 <- ivreg(weeksm1 ~ morekids + agem1 + black + hispan + othrace|samesex + boy1st + boy2nd + agem1 + black + hispan + othrace)
  # Wald test formula and p-value
  Wald <- (betahat-beta0)%*%solve(covmat[c(3,4,7),c(3,4,7)])%*%(betahat - beta0)
  1-pchisq(Wald,df=3)
  #or simply use the linearHypothesis command
  linearHypothesis(ivmod,c("boy1st=0","boy2nd=0","hispan=0"), V=covmat)
  
