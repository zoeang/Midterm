#' Expected a posteriori value of theta_j
#' 
#' Estimates the a posteriori value of theta_j using a scary formula
#' 
#' @param raschObj An object of class Rasch
#' @param lower The lower limits of integration; default is -6
#' @param upper The upper limits of integration; default is 6
#' 
#' @return The value of theta_j as specified by the scary formula
#' @examples raschObj<-new(Class = "Rasch", name="Zoe", a=rep(1,3), yj=c(0,1,0))
#' theta<-1
#' EAP(raschObj, lower=1, upper=2)
#'
#' @author Zoe <\email{zoeang@wustl.edu}>
#' @seealso \code{\link{likelihood}}, \code{\link{prior}}
#' @rdname EAP
#' @export
setMethod("initialize", "Rasch", function(.Object, ...){
value=callNextMethod()
validObject(value)
return(value)
})


#' @export
setGeneric("EAP", #The generic is called EAP
           function(object,...) { #***
             standardGeneric("EAP")
           })


#' @export
setMethod(f="EAP", signature="Rasch",
          definition=function(object, lower=-6, upper=6){
            numerator<-function(theta){
              theta*likelihood(object, theta)*prior(theta)
            }
            int.num<-integrate(numerator,lower,upper)$value
            
            denominator<-function(theta){
              likelihood(object, theta)*prior(theta)
            }
            int.den<-integrate(denominator, lower,upper)$value
            return(int.num/int.den)
          }
)

