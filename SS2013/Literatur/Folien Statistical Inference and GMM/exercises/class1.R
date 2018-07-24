########################## Statistical Inference Winter 2011/12
########################## Class 1
##If you have any questions, please contact me: willi.mutschler@uni-muenster.de

##################
## Introduction ##
##################
#to get an idea how powerfull R is, just try the following commands
	example(lm)
	demo(graphics)
	demo(lm.glm)
	library(tcltk); demo(tkcanvas)
	RSiteSearch("GMM")

##################
### Exercise 1 ###
##################
	### 1.2 ###
	1+1
	2-1
	3/2
	2*4
	2^10
	q()
	# In order to save your workspace, you can also use 
	save.image(file.choose())
	#In order to save your history, i.e. the commands you've executed, use
    savehistory(file.choose())
	#To load your workspace and history use
	load(file.choose())
	loadhistory(file.choose())
	#better: use the GUI!!!
	
	### 1.3 ###
	a <-3
	b <-4
	c <- a+b
	pi
	Pi
	PI
	
	#there are three ways to print the contents of the variable
	(c <- a+b) 	#Parentheses around a command prints it output 
	print(c)   	#The command print()
	c			#Just type in the variable
	
	### 1.4 ###
	getwd()
	setwd("c:/") #important: Windows uses the backslash \, R uses the slash /
	getwd()
	
	### 1.5 ###
	?mean
	??mean
	apropos("mean")
	example("mean")
	find("mean")

	### 1.6 ###
	#If you want to specify a folder for the installation files of the package, use: .libPaths("X:/Your Folder")
	install.packages("xlsx") #very important: JAVA needs to be installed on your computer otherwise you get an error
	library(xlsx)
	library(help=xlsx)
	library(AER)
	
##################
### Exercise 2 ###
##################
	### 2.1 ###
	x <- read.csv(file.choose())
	x

	### 2.2 ###
	#specify the symbol for the decimal point and seperator
	x <- read.csv(file.choose(), dec=",",sep=";")
	x
	x <- read.csv(file.choose()) # if you use the "English" decimal point
	x <- read.csv2(file.choose()) # if you use the "German" decimal point
	x

	#load from the clipboard (CTRL+C)
	#Hint: This command won't work in a script (since it overrides the clipboard), so type it in the command window of R
	x <- read.table("clipboard", header=TRUE, dec=",")
	x
	
	#use the package xlsx
	library(xlsx)
	?read.xlsx
	x <- read.xlsx(file.choose(),sheetIndex=1)
	x

	### 2.3 ###
	x <- read.csv("http://www.wiwi.uni-muenster.de/statistik/download/studium/inference/ws1112/data/bsp1.txt")
	x

	### 2.4 ###
	install.packages("foreign")
	library(foreign)
	library(help=foreign)
	x <- read.dta(file.choose())
	x

	#R's data format
	save(x, file=file.choose())
	rm(x)
	x
	load(file.choose())
	x
	
	#Additional information: Editing data
	x <- scan()   # you can input as many things as you like, copy&paste works as well (very handy)
	data.entry(x) # edits your data
	edit(x)		  # edits your data
	
	#######################################################
	## Additional information: Missing Values & Trimming ##
	#######################################################
	0/0
	y <- c(1:3,NA,NA,4:2)
	y
	mean(y)
	is.na(y) # a query to get NAs
	which(is.na(y)) # another way to get the positions of the NAs
	y[-4] # removes the 4th entry
	
	y <- c(1:3,NA,NA,4:2)
	y[which(is.na(y))]=0 ;y # overrides NA with 0, note: y changes!
	
	y <- c(1:3,NA,NA,4:2)
	y[-which(is.na(y))]; y # removes the NA, note: y has not changed!
	
##################
### Exercise 3 ###
##################
	### 3.1 ###
	x <- read.csv2(file.choose())
	head(x)
	tail(x)
	names(x)
	str(x) # gives you the structure and and overview of the object
	class(x) # gives you the type of the object
	attributes(x) # gives you a very good overview of the attributes of the object
	
	### 3.2 ###
	#To access data there are at least 3 ways to do it
	#1) With the dollar sign
	x$dax
	#2) with braskets
	x[,1]
	#3) with the attach command
	attach(x)
	print(dax)

	### 3.3 ###
	plot(dax)
	plot(log(dax)) #compare the y-axis!

	### 3.4 ###
	dim(x)
	n <- dim(x)[1]; n
	head(dax)
	head(dax[2:n])     # vector containing all elements of dax except the first one
	
	tail(dax)
	tail(dax[1:(n-1)]) # vector containing all elements of dax except the last one
	rdax <- log(dax[2:n]/dax[1:(n-1)]) 
	head(rdax)
	length(rdax)
	rftse <- log(ftse[2:n]/ftse[1:(n-1)])
	
	plot(rdax)
	library(MASS)
	truehist(rdax)
	
	mean(rdax)
	var(rdax)
	sd(rdax)
	median(rdax)
	quantile(rdax,probs=c(0.01,0.99))
	range(rdax)
	
	boxplot(rdax)
	boxplot(rdax,rftse)

	plot(rdax,rftse)
	
	cor(rdax,rftse)

	m <- length(rdax) #Attention dim(rdax) doesn't work (dim(rdax)=NULL), so we have to use the length of the vector. Note: A vector has the dimension of NULL!
	cor(rdax[2:m],rdax[1:(m-1)])
	
##################
### Exercise 4 ###
##################
	### 4.1 ###
		#1)
		x  <- read.csv(file.choose())
		head(x)
		tail(x)
		names(x)
		str(x)
		attach(x)
		plot(str,testscr)

		#2)
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score")

		#3)
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score",main="CA Test Score Data")

		#4)
		print(colors())
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score",main="CA Test Score Data", col="violet")

		#5)
		?points #read the pch settings
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score",main="CA Test Score Data")
		points(mean(str),mean(testscr), col= "red", pch=23)

		#6)
		#either
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score",main="CA Test Score Data")
		points(mean(str),mean(testscr), col= "red", pch=19)
		text(mean(str)-1,mean(testscr),"MEAN", col="red")
		#or
		plot(str,testscr,xlab="Student Teacher Ratio", ylab="Test Score",main="CA Test Score Data")
		points(mean(str),mean(testscr), col= "red", pch=19)
		text(locator(1),"MEAN", col="red") #locator(n) asks for n positions

		#7)
		par(mfrow=c(2,2))
		plot(testscr, str, xlab = "Test Score", ylab="Student-teacher-ratio")
		plot(testscr, el_pct,xlab = "Test Score", ylab="Percentage English learners")
		plot(testscr, meal_pct,xlab = "Test Score", ylab="Percentage reduced price lunch")
		plot(testscr, calw_pct,xlab = "Test Score", ylab="Percentage income assistance")
		
	### 4.2 ###
		#1)
		indices <- read.csv2(file.choose())
		head(indices)
		tail(indices)
		names(indices)
		str(indices)
		attach(indices)
		
		dax_norm <- 100*dax/dax[1]
		par(mfrow=c(3,1))
		plot(dax)
		plot(dax_norm)
		plot(dax,dax_norm) #Perfect linear correlation
		cor(dax,dax_norm)  #Perfect linear correlation

		#2)
		par(mfrow=c(1,1))
		ftse_norm <- 100*ftse/ftse[1]
		plot(dax_norm,type="l", col="blue")
		lines(ftse_norm, col="red")

		#3)
		plot(dax_norm,type="l", col="blue")
		lines(ftse_norm, col="red")
		legend(locator(1), legend=c("Normalized Dax", "Normalized FTSE"), fill = c("blue","red"))
