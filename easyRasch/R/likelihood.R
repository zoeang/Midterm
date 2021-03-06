#' Likelihood of a proposed value of theta_j
#' 
#' Calculates the likelihood od a proposed value of theta_j givn the responses of the test taker
#' 
#' @param raschObj An object of class Rasch
#' @param theta A proposed valie of theta_j
#' 
#' @return The calculated likelihood of theta_j conditioned on yj
#' @examples raschObj<-new(Class = "Rasch", name="Zoe", a=rep(1,3), yj=c(0,1,0))
#' theta<-1
#' likelihood(raschObj, theta)
#' @author Zoe <\email{zoeang@wustl.edu}>
#' @seealso \code{\link{probability}} 
#' @rdname likelihood
#' @export
setMethod("initialize", "Rasch", function(.Object, ...){
  value=callNextMethod()
  validObject(value)
  return(value)
})

#' @export
setGeneric("likelihood", #The generic is called likelihood
           function(object="Rasch",...) { #***
             standardGeneric("likelihood")
           })

#' @export
setMethod(f="likelihood", signature="Rasch",
          definition=function(object=raschObj, theta=theta){
            prob.output<-probability(object, theta)
            names(prob.output)<-c("P","Q")
            like.output<-(prob.output$P^(object@yj))*(prob.output$Q^(1-object@yj))
            return(prod(like.output))
            }
         )

