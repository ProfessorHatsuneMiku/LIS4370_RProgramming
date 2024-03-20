# Module 11 - LIS 4370

# This code contains a "deliberate" bug. Find the bug and fix it.

tukey_multiple <- function(x) {
  outliers <- array(TRUE,dim=dim(x))
  for (j in 1:ncol(x))
  {
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
  }
  outlier.vec <- vector(length=nrow(x))
  for (i in 1:nrow(x))
  { outlier.vec[i] <- all(outliers[i,]) } return(outlier.vec) }

# The error in the code can be found in the second for loop, more specifically,
# the placement of the return statement. Currently, it's inside the curly braces.
# To fix the error, let's place the return statement outside the braces and enhanced
# readability, let's readjust the placement of the curly braces. 

tukey_multiple <- function(x) {
  outliers <- array(TRUE,dim=dim(x))
  for (j in 1:ncol(x)) {
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
  }
  outlier.vec <- vector(length=nrow(x))
  for (i in 1:nrow(x)) { 
    outlier.vec[i] <- all(outliers[i,]) 
  } 
  return(outlier.vec) 
}