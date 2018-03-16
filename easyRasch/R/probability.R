#' A probability function for Pij
#' 
#' Calculates the probability of Pij, the output of a Rasch model
#' 
#' @param raschObj An object of class Rasch
#' @param theta A proposed valie of theta_j
#' 
#' @return A vector of length n that represents Pij for each question
#' @author Zoe <\email{zoeang@wustl.edu}>
#' 
#' @rdname probability
#' @export
setMethod("initialize", "Rasch", function(.Object, ...){
value=callNextMethod()
validObject(value)
return(value)
})

#' @export
setGeneric("probability", #The generic is called probability
function(object="Rasch",...) { #***
  standardGeneric("probability")
})


#' @export
setMethod(f="probability", signature="Rasch",
          definition=function(object=raschObj, theta=theta){
            Pij<-rep(NA, length(object@a))
            Pij<-(exp(theta-object@a))/(1+exp(theta-object@a))
            Qij<-1-Pij
            PQ<-rep(NA, length(object@a))
            for(i in 1:length(object@yj)){
              if(object@yj[[i]]==0){
                PQ[[i]]<-Qij[[i]]
              } else if(object@yj[[i]]==1){
                PQ[[i]]<-Pij[[i]]
              }
            }
            return(list(Pij,PQ))
          }
          )

