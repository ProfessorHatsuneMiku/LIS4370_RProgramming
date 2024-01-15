# LIS4370 R Programming - Module 2 Post

# a vector of numbers is assigned to variable assignment2
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Performs mean calculation by taking the sum of the inputted vector
# and dividing it by the length of the vector
myMean <- function(assignment2) { 
  return(sum(assignment2)/length(assignment2)) 
}


# Let's perform the calculation using the variable assignment2
myMean(assignment2)

# The mean is 19.25