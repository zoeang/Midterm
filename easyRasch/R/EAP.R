#' Expected a posteriori value of theta_j
#' 
#' Estimates the a posteriori value of theta_j using a scary formula
#' 
#' @param raschObj An object of class Rasch
#' @param lower The lower limits of integration; default is -6
#' @param upper The upper limits of integration; default is 6
#' 
#' @return The value of theta_j as specified by the scary formula
#' @author Zoe <\email{zoeang@wustl.edu}>
#' 
#' @rdname EAP
#' @export
setMethod("initialize", "Rasch", function(.Object, ...){
value=callNextMethod()
validObject(value)
return(value)
})


#' @export
setGeneric("EAP", #The generic is called EAP
           function(object="Rasch",...) { #***
             standardGeneric("EAP")
           })


#' @export
setMethod(f="EAP", signature="Rasch",
          definition=function(object=raschObj,lower=-6, upper=6, thetanum=theta){
            #denominator
            like.out<-likelihood(object,theta)
            prior.out<-prior(theta)
            ftheta<-function(x=like.out, y=prior.out){
              return(x*y)
            }
            denominator<-integrate(f=ftheta, lower=lower, upper=upper)
            #numerator
            ftheta2<-function(x=like.out, y=prior.out, thetanum=theta){
              return(thetanum*x*y)
            }
            numerator<-integrate(f=ftheta2, lower=lower, upper=upper)
            return(numerator/denominator)
          }
)

