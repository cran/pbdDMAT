#' Type Checks, Including NA, NaN, etc.
#' 
#' Functions to check for various types.
#' 
#' Performs the appropriate type check.
#' 
#' @param x 
#' numeric distributed matrix
#' 
#' @return 
#' Returns boolean in the case of \code{is.numeric()} and
#' \code{is.ddmatrix()}, otherwise a distributed matrix.
#' 
#' @keywords Methods Type
#' @name isdot
#' @rdname isdot
NULL



#' @rdname isdot
#' @export
is.ddmatrix <- function(x)
{
  if (is(x, "ddmatrix"))
  {
    ldim <- base.numroc(dim=x@dim, bldim=x@bldim, ICTXT=x@ICTXT)
    if (any(ldim != x@ldim))
      comm.warning("distributed matrix has bad slot 'ldim'")
    
    return(TRUE) 
  }
  else
    return(FALSE)
}

#' @rdname isdot
#' @export
setMethod("is.na", signature(x="ddmatrix"),
  function(x)
  {
    x@Data <- base::is.na(x@Data)
    return(x)
  }
)

#' @rdname isdot
#' @export
setMethod("is.nan", signature(x="ddmatrix"),
  function(x)
  {
    x@Data <- base::is.nan(x@Data)
    return(x)
  }
)

#' @rdname isdot
#' @export
setMethod("is.numeric", signature(x="ddmatrix"),
  function(x)
    base::is.numeric(x@Data)
)

#' @rdname isdot
#' @export
setMethod("is.infinite", signature(x="ddmatrix"),
  function(x)
  {
    x@Data <- base::is.infinite(x@Data)
    return(x)
  }
)
