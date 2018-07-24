########################## Statistical Inference Winter 2011/12
########################## Class 2
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

##################
### Exercise 5 ###
##################

###########
### 5.1 ###
###########

  #1)
  log(10,10)
  log(10,base=10)
  
  sqrt(2); sin(pi); exp(1); log(10)
  log(10,10);log(10,base=10)
  sqrt(2

  #2)
  simpsons <- c("Homer","Marge","Bart","Lisa","Maggie")
  x <- c(1,2,3,4,5,6,7,8,9,10)
  x <- c(1:10)
  length(simpsons); sum(x); mean(x)
  simpsons[3]
  simpsons[-3]
  
  #3)
  x <- 0:10
  sum(x<5)
  x<5
  
  x*(x<5)
  sum(x*(x<5)) #simple
  
  x[x<5]
  sum(x[x<5]) # more elegant

###########
### 5.2 ###
###########
       
  ?seq
  ?rep
  
  # x=(1,2,...,100) 
  x <- 1:100; x

  # x=(2,4,...,1000)
  x <- 2*(1:500)
  x <- seq(2,1000,by=2); x

  # equi-spaced grid from -4 to 4 with 500 grid points
  x <- seq(-4,4,length.out=500); x
  length(x)
  x[2]-x[1] 
  x[2]-x[1] == x[300]-x[299]

  # 100 missing values
  x <- rep(NA,100); x

  # x=(0,1,2,0,1,2,...,0,1,2) with length 300
  x <- rep(c(0,1,2),100); x
  length(x)

  # vector with 0 except a 1 at position 40, length 100
  # several ways to do this
  x <- c(rep(0,39),1,rep(0,60)); x ;length(x)
  x <- rep(0,100); x[40] <- 1; x; length(x)

###########
### 5.3 ###
###########
       
  library(MASS)
  #1)
  ?rnorm
  x <- rnorm(10000); x
  truehist(x)

  #2)
  ?rt
  r <- rt(500,3); r
  plot(r)
  mean(r) # expectation of a student t-distribution is E(r) = 0
  var(r)  # variance of a student t-distribution is Var(r) = (k)/(k-2) with k degrees of freedom. Here: Var(r)=3
  truehist(r)
  
  #3)
  x <- 1:10
  x; cumsum(x)
  plot(cumsum(r)) # Random walk!

###########
### 5.4 ###
###########
       
  #1)
  ?Control
  r <- rt(500,3)
  Z <- rep(NA,length(r))
  
  for (i in 10:length(r)) {
    Z[i] <- mean(r[-10:10 + i])
  }
  
  plot(r)
  lines(Z, col="red")
  abline(h=mean(r), col="blue")
  
  #2)
  ??"Log normal"
  ?Lognormal
  Z <- rep(NA,10000)
  for (r in 1:10000) {
  	Z[r] <- max(rlnorm(100))
  }
  
  library(MASS)  
  truehist(Z)
  truehist(rlnorm(10000))
  
###########
### 5.5 ###
###########
       
  #1)
  fexmpl1 <- function(x) {
    z <- x^2 + sin(x)
    return(z)
  }
  str(fexmpl1)

  x <- seq(-3,3,length.out=500)
  plot(x,fexmpl1(x))
  
  #2)
  mp <- function(x,p) {
  	n <- length(x)
  	m <- 1/n * sum(x^p)
  	return(m)
  }
  
  x <- c(1,2,3)
  mp(x,1)
  mp(x,2)

###########
### 5.6 ###
###########
  ?optimize
  ?optim
  #1)
  #look at exercise 5.5 1), the minimum lies between -1 and 0
  optimize(fexmpl1, upper=0, lower=-1)
  
  #2)
  f <- function(x,y) x^2+sin(x)+y^2-2*cos(y)
  x <- seq(-5,5,by=.2)
  y <- seq(-5,5,by=.2)
  z <- outer(x,y,f)
  
  #you can try to edit phi and theta to get a better view
  persp(x,y,z,phi=-45,theta=45,col="yellow",shade=.65 ,ticktype="detailed")
  #the Minimum appears to be at (-.5,0)
  
  #note: When using optim for multidimensional optimization, the argument in your definition of the function must be a single vector
  fx <- function(x) x[1]^2+sin(x[1])+x[2]^2-2*cos(x[2])
  optim(c(-.5,0),fx) # does work!
  optim(c(-.5,0),f) #does not work

##############
# Exercise 7 #
##############

###########
### 7.1 ###
###########
       
       #1)
       caschool <- read.csv(file.choose())
       View(caschool)
       attach(caschool)
       
       regr <- lm(testscr~str)
       print(regr)
       str(regr) #a very complexe object! You can acces those things using the $ sign.
       
       plot(str,testscr, xlab="Student-Teacher-Ratio", ylab="Testscore", main="Scatterplt", pch=20)
       abline(regr, col="red",lwd=3, lty=2)
       
       #2)
       prediction <- predict(regr, newdata=data.frame(str=19.33))
       plot(str,testscr, xlab="Student-Teacher-Ratio", ylab="Testscore", main="Scatterplt", pch=20)
       abline(regr, col="red",lwd=3, lty=2)
       #add the point
       points(19.33, prediction, col="blue", pch=20)
       #lines connect two points with a straight line. Note: abline needs a slope and an intercept to draw a straight line
       lines(c(19.33, 19.33), c(0,prediction),lty=3, col="blue")
       lines(c(0, 19.33), c(prediction,prediction),lty=3, col="blue")
       
       #3)
       #Either use the function residuals
       sum(residuals(regr))
       #Or extract them from the object regr with the dollar sign
       sum(regr$residuals)
       
       #4)
       plot(residuals(regr))
       abline(h=0)
       
       #5)
       plot(regr$residuals,str)
       
       #6)
       print(summary(regr)) # with this command you assume homoskedasticity
       
       library(AER)
       print(coeftest(regr,vcov=vcovHC)) #with this command you assume heteroskedasticity 
       
       #7)
       # Acces the variables
        BETA <- coeftest(regr,vcov=vcovHC)[2,1]
        SDBETA <- coeftest(regr,vcov=vcovHC)[2,2]
        #t-Test
        H0 <- -1
        t <- (BETA- (H0))/SDBETA
        t
        #the critical values are 1.96 (5%) and 2.58 (1%)
        abs(t) > 1.96; abs(t) > 2.58
        #H0 can be rejected with a signifiance level of 5%! The estimate is signifiantly different from -1.
       
       #There is also a function for linear hyothesis testing  (F-Test:
       linearHypothesis(regr,c("str=-1")) 
       
       #8)
       lower_limit <- BETA - 1.96*SDBETA
       upper_limit <- BETA + 1.96*SDBETA
      
       names(lower_limit)="lower limit"; names(upper_limit)="upper limit"
       print(c(lower_limit, upper_limit))

       
       
###########
### 7.2 ###
###########
      
      library(AER)
      #1)
      x <- read.csv(file.choose())
      head(x)
      attach(x)
      regr <- lm(testscr~str+el_pct)
      regr
      
      #2)
      simple <- lm(testscr~str)
      r1 <- residuals(simple)
      plot(r1)
      
      multiple <- lm(testscr~str + el_pct + expn_stu)
      r2 <- residuals(multiple)
      plot(r2)
      
      plot(r1,ylab="")
      points(r2,col="red")
      
      sum(r1^2)
      sum(r2^2)
      sum(r1^2) > sum(r2^2)
      
      #3)
      multiple <- lm(testscr~str + el_pct + expn_stu)
      predict(multiple, newdata=data.frame(str=25, el_pct=0.6, expn_stu=4000))
      predict(multiple, newdata=data.frame(str=17, el_pct=0.6, expn_stu=4000))
      
      #4)
      regr <- lm(testscr~str + el_pct + expn_stu)
      summary(regr)
      coeftest(regr, vcov=vcovHC)
             
      #5)
      linearHypothesis(regr,c("str=0","expn_stu=0","el_pct=-.7"))
             