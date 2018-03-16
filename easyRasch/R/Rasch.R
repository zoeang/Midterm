#' An object of class Rasch 
#' 
#' Object of class Rasch, which relates to the Rasch model
#' 
#' An object of class Rasch has the following slots:
#' \itemize{
#' \item \code{name} The name of the test taker
#' \item \code{a} A vector of question-item parameters
#' \item \code{yj} A vector of answers for the respondent
#'}
#' @example new(Class = "Rasch", name="Zoe", a=rep(1,3), yj=c(0,1,0))
#' @author Zoe <\email{zoeang@wustl.edu}>
#' @aliases Rasch-class
#' @rdname Rasch
#' @export
setClass(Class="Rasch",
         representation = representation(
           name="character", #set the class of the slot
           a="numeric",
           yj="numeric"
         ),
         prototype= prototype(
           name=c(), #leave the default data empty
           a=c(),
           yj=c()
         )
)

#' @export
setValidity("Rasch", function(object){
  test1<-length(object@a)==length(object@yj)
  if(!test1)return("The question item parameter vector, a, must be the same length as the answer vector, yj")
  test2<- (object@yj==0 || object@yj==1)
  if(!test2) return("elements of yj must be either 0 or 1")
}
)

#' @export
setMethod("initialize", "Rasch", function(.Object, ...){
  value=callNextMethod()
  validObject(value)
  return(value)
})
#' @export
setMethod("print", "Rasch",
          function(x){ 
            print(c(x@name,EAP(x)))
          })
#=====================================================


