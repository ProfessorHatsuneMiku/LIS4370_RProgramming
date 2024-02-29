# LIS 4370 R Programming - Module 8 Assignment

# Load necessary packages
library(plyr)

# Step 1: Import text file into R
# Note: file.choose opens up your file directory, so be prepared to manually select the file
x <- read.table(file.choose("Assignment 6 Dataset.txt"), header = TRUE, sep = ",")

# Step 2:
# With plyr installed, use ddply to...
# Generate mean of Age and Grade variables split by Sex variable
y <- ddply(x, "Sex", transform, Grade.Average = mean(Grade))

# Step 3:
# With our new variable, Grade.Average, let's print this to a file
write.table(y, "Sorted.Average")

# Remember to note the placement of where Sorted.Average will be in your file directory, you may have to go look for it. 

# Looking at Sorted.Average, there are double quotes ("") around each value, let's change that.
write.table(y, "Sorted.Average", sep = ",")

# First off, this will overwrite the current Sorted.Average file so be prepared for that change.
# Secondly, sep or separate allows for one to insert a character like forward slash / or comma
# in between the values of the dataset.

# Step 4: filter the names in the list that contain the letter (i)
# Save the result to a new file
newx <- subset(x, grepl("[iI]", x$Name))

# Save result to new file called DataSubset
write.table(newx, "DataSubset", sep = ",")
