#Set up package

rm(list=ls())
library(devtools)
library(roxygen2)
setwd("C:/Users/zoeja/OneDrive/Documents/Spring2018/R/Midterm")
#Write function
#Run the function before running skeleton
#This can be deleted after the package is created/ skeleton is run


#a package is created under the working directory
package.skeleton(name="easyRasch")

dir()
#build and check
current.code<-as.package("easyRasch")
load_all(current.code)
document(current.code)



#=====================================
#Test Class
new(Class = "Rasch",  #Works
    name="Frank", 
    a=seq(1,5,1), 
    yj=c(0,0,0,1,1))

new(Class = "Rasch", #doesn't work; correct error for yj
    name="Frank", 
    a=seq(1,5,1), 
    yj=c(3,0,0,1,1))

new(Class = "Rasch", #doesn't work; correct error for a
    name="Frank", 
    a=seq(1,4,1), 
    yj=c(3,0,0,1,1))

#toy data/examples
raschObj<-new(Class = "Rasch", name="Zoe", a=rep(1,3), yj=c(0,1,0))
theta<-1
probability(raschObj, theta)
likelihood(raschObj,theta)*prior(theta)*theta
prior(theta)
EAP(raschObj, lower=1, upper=2)
print(raschObj)
#+++++++++++++++++++++
 