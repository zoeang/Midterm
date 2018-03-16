#' Estimate theta_j using Bayesian prior
#' 
#' Estimates theta_j using Bayesian prior to get a more reasonable estimate of the parameter; this wull use the normal curve with mean=0 and sd=3 
#' 
#' @param theta A proposed valie of theta_j
#' 
#' @return The height of the specified nromal curve evaluated at theta_j
#' @author Zoe <\email{zoeang@wustl.edu}>
#' 
#' @rdname prior
#' @export
setMethod("initialize", "numeric", function(.Object, ...){
  value=callNextMethod()
  validObject(value)
  return(value)
})

#' @export
setGeneric("prior", #The generic is called prior
           function(object="numeric") { #***
             standardGeneric("prior")
           })


#' @export
setMethod(f="prior", signature="numeric",
          definition=function(object=theta){
           dnorm(object,0,3)
          }
)