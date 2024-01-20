# LIS4370 R Programming - Module 3 dataframes

# The dataset below is based on the presidential election during 2016
# and outlines the name of the candidate, and the source of the poll:
# (ABC vs. CBS)

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_political_pollresults <- c(4, 62, 51, 21, 2, 14, 15)

CBS_political_pollresults <- c(12, 75, 43, 19, 1, 21, 19)

# Discuss the result in your blog

# At the moment, these are three separate vectors containing data for the
# following variables: Name, ABC_political_pollresults, and
# CBS_political_pollresults

# Let's combine each of these variables and place them into one
# dataframe called election

election <- data.frame(Name, ABC_political_pollresults, CBS_political_pollresults)

# Now, let's take a look at the structure of the dataframe
str(election)
