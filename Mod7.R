# LIS 4370 R Programming Module 7 Assignment
#install.packages("pryr")
library(pryr)

# Question 1:
# Determine if a generic function can be assigned to your dataset
# To begin, I will with the built-in dataset: iris
str(iris)
summary(iris)
tail(iris)

# Yes, generic functions can be applied to the iris dataset

# Question 2:
# How do you tell what OO system (S3 vs. S4) an object is associated with?
# One can simply use the otype() function from the pryr package to determine
# object type.
otype(iris)

# Question 3: How do you determine what the base type of an object is?
# Using the typeof() function can help determine an object's base type
# Continuing with iris, we can check the object type of each of the variables
# within that dataset
typeof(iris$Sepal.Length)
typeof(iris$Petal.Length)
typeof(iris$Species)

# Question 4: What is an generic function?
# A generic function can be defined as a function that performs a common task
# like printing (print()) or even plotting (plot()). Furthermore, they can
# be thought as extended function objects because they contain information
# that is used in creating and dispatching for the function.

# Question 5: What are the main differences between S3 and S4?
# To put it simply, S3 is considered more convenient while S4 is more safe.
# Additionally, S3 classes are very straightforward to implement as it only
# uses the first argument to dispatch but it can allow for mistakes
# to slip through like misspelled values and missing values and will not alert
# the programmer of the potential issues. On the other hand, S4 classes and methods are
# way more formal and more closely related to object-oriented concepts and unlike
# S3, S4 will complain about such misspellings and other issues to alert
# the programmer that the current code does need to be fixed. 

# Question 6: create two examples of S3 and S4

# For an example of S3, I will create a simple pet shelter adoption information dataset
adoption_info <- list(name = "Rex", petAge = 2, petType = "dog", Sex = "M")
  class(adoption_info) <- "available_pets"
  
adoption_info

# Example of S4:
# Let's add some staff members to the pet shelter
setClass("employee",
         representation(
         name = "character",
         salary = "numeric",
         workOvertime = "logical"
         ) )

zoey <- new("employee", name = "Zoey", salary = 15, workOvertime = F)
zoey

bob <- new("employee", name = "Bob", salary = 25, workOvertime = T)
bob