########################## Statistical Inference Winter 2011/12
########################## Class 3
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

##################
### Exercise 7 ###
##################

#Exercise 7.5
    x <- read.csv2(file.choose())
    head(x)
    attach(x)
    cor(x)
    
    #1
    regra <-lm(y ~ x1+x2+x3+x4)
    summary(regra)
    linearHypothesis(regra,c("x1=2","x2=3","x3=4","x4=5"))
    #2
    regrb <- lm(y~x2+x3+x4)
    summary(regrb)
    linearHypothesis(regrb,c("x2=3","x3=4","x4=5"))
    #3
    regrc <- lm(y~x1+x2+x3)
    summary(regrc)
    linearHypothesis(regrc,c("x1=2","x2=3","x3=4"))
       
#Exercise 7.7
    x <- read.csv(file.choose())
    names(x)
    head(x)
    attach(x)
    str(x)
    
    #1
    plot(dauer, gehalt, xlab="Duration", ylab="Salary", main = "Scatterplot")
    
    #2
    model <- lm(gehalt~dauer)
    model
    plot(dauer, gehalt, xlab="Duration", ylab="Salary", main = "Streudiagramm")
    abline(model)
    
    #3
    chem <- lm(gehalt~dauer, data=x[fach==1,])
    chem
    econ <- lm(gehalt~dauer, data=x[fach==2,])
    econ
    
    plot(dauer, gehalt, xlab="Duration", ylab="Salary", main = "Scatter")
    points(x[fach==1,2],x[fach==1,1],col="blue") #mark chem students
    points(x[fach==2,2],x[fach==2,1], col="red") #mark econ students
    abline(model)
    abline(chem, col="blue")
    abline(econ, col="red")
    legend("topright", legend=c("Total","Chemistry", "Economics"), fill = c("black","blue","red"))
    
#Exercise 7.8
    y <- read.csv2(file.choose())
    head(y)
    names(y)
    str(y)
    attach(y)
    #1
    plot(Horstpaare, Geburten, xlab="Number storks", ylab="Number of births")
    regr <- lm(Geburten ~ Horstpaare)
    regr
    abline(regr)
    
    #2
    regr1 <- lm(nichtehelich ~ Horstpaare)
    regr1
    plot(Horstpaare, nichtehelich, xlab="Number storks", ylab="Number of out-of-wedlock births")
    abline(regr1)
          
#Exercise 7.9 
    z <- read.csv2(file.choose())
    head(z)
    names(z)
    str(z)
    attach(z)
    
    n <- dim(z)[1]
    kdax <- dax[6:n]
    kftselag <- ftse[1:(n-5)]
    
    plot(kftselag,kdax)
    obj <- lm(kdax ~ kftselag)
    obj
    summary(obj)
    library(AER)
    coeftest(obj, vcov=vcovHC)

###############################################################

#Exercise 8.3
    #1)
    gaussian <- read.csv(file.choose())
    View(gaussian)
    attach(gaussian)
    
    library(AER)
    x <- seq(-4, 4, length=100)
    par(mfrow=c(2,2))
    
    truehist(V1); lines(x,dnorm(x))
    truehist(V2); lines(x,dnorm(x))
    truehist(V3); lines(x,dnorm(x))
    truehist(V4); lines(x,dnorm(x))
    
    #2)
    cor(gaussian)
    
    #3)
    pairs(gaussian)
    
    #4)
    Y <- V1+V2+V3+V4
    par(mfrow=c(1,1))
    truehist(Y); lines(x,dnorm(x, mean=mean(Y),sd=sd(Y)))

# Exercise 8.4
   X <- rnorm(1000)
   
   U <- sample(c(-1, 1), 1000, replace = TRUE)
   Y <- U*X
   truehist(X)
   truehist(Y)
   cov(X,Y)
   plot(X,Y)       
   Z <- X+Y
   mean(Z)
   par(mfrow=c(1,1))
   truehist(Z)       
