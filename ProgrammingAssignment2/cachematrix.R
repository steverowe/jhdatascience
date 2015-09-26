## This file contains two functions which operate on the CacheMatrix type.
##  New CacheMatrix objects are created with the makeCacheMatrix() function.
##  The inverse of the matrix can be calculated and retrieved using the cacheSolve() function.
##
## Example use:
##  m <- makeCacheMatrix(matrix(c(1, 3, 3, 1, 4, 3, 1, 3, 4), nrow=3, ncol=3))
##  cacheSolve(m)

## makeCacheMatrix creates a special "matrix" whose inverse can be cached by the 
## cacheSolve() function.  It is really a list of functions:
##          set() # set the value of the matrix
##          get() # get the value of the matrix
##          setInverse() # set the inverse of the matrix
##          getInverse() # get the inverse of the matrix
##          

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve returns the inverse of a CacheMatrix.
##  If the inverse has not already been calculated, it calculates the inverse.
##  If the inverse has already been calculated, it returns the cache of the matrix.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
