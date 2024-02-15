# LIS4370 R Programming Katie Burkhart
# Module 6 - Doing math with R (Part 2)

# Question 1:
# Consider A <- matrix(c(2, 0, 1, 3), ncol = 2) and
# B <- matrix(c(5, 2, 4, -1), ncol = 2)

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# a) Find A + B
A + B
# b) Find A - B
A - B

# Question 2:
# Use the diag() function to build a matrix of size 4 with the
# following values in the diagonal: 4, 1, 2, 3

matrix_2 <- diag(c(4, 1, 2, 3))
matrix_2

# Question 3:
# Generate the following matrix:
## [,1] [,2] [,3] [,4] [,5]
## [1,] 3 1 1 1 1
## [2,] 2 3 0 0 0
## [3,] 2 0 3 0 0
## [4,] 2 0 0 3 0
## [5,] 2 0 0 0 3

# HINT: Use the diag() function

matrix_3 <- diag(3, 5, 5)
matrix_3[1,2:5] <- 1
matrix_3[2:5,1] <- 2
matrix_3
