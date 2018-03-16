#Set up package

rm(list=ls())
library(devtools)
library(roxygen2)
setwd("C:/Users/zoeja/OneDrive/Documents/Spring2018/R/")
#Write function
#Run the function before running skeleton
#This can be deleted after the package is created/ skeleton is run


#a package is created under the working directory
package.skeleton(name="TestPack")

dir()
#build and check
current.code<-as.package("TestPack")
load_all(current.code)
document(current.code)
test(current.code)
add.sig(3)
