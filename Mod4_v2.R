# LIS4370 R Programming - Module 4
# Kathryn Burkhart

# The following data is from a local hospital.
# The data set contains 5 variables based on the observation of 8 patients
# Additionally, the data displays the measurement of blood pressure, 
# first assessment by general doctor (bad=1, good =0) titled "first",
# the second assessment by external doctor (called "second"), 
# and the last row provides the head of the emergency unit's decision regarding 
# immediate care for the patient based on the values 0 or 1 (low = 0, high =1).
# The names of your variables are as follows: 
# "Freq","bloodp","first”, " second”, ”finaldecision”

# Step 1: insert data entries into vectors under the appropriate names and 
# put them into a data frame.

Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)

bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

# General Doctor Assessment: Bad = 1, Good = 0
first <- c(1, 1, 1, 1, 0, 0, 0, 0, "NA", 1)

# External Doctor Assessment: Low = 0, High = 1
second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)

# Emergency unit decision: Low = 0, High = 1
finaldecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

# Patient Info data frame
patientInfo <- data.frame(Freq, bloodp, first, second, finaldecision)

# Make sure first is numeric
patientInfo$first <- as.numeric(patientInfo$first)

# The second thing I want to go over is how to best convey the ratings of the three
# medical professionals caring for these patients:
# General Doctor (first), External Doctor (second), Head of Emergency Unit (finaldecision)
# What can be done is to create a new column called overall_decision to effectively
# judge if the medical professionals made a good or bad decision regarding patient care.

# Create a new column 'overall_decision'
patientInfo$overall_decision <- NA

# Combine information from 'first', 'second', and 'final' into 'overall_decision'
for (i in 1:nrow(patientInfo)) {
  if (!is.na(patientInfo$first[i])) {
    patientInfo$overall_decision[i] <- as.numeric(patientInfo$first[i])
  } else if (!is.na(patientInfo$second[i])) {
    patientInfo$overall_decision[i] <- patientInfo$second[i]
  } else {
    patientInfo$overall_decision[i] <- patientInfo$finaldecision[i]
  }
}

# Convert 'overall_decision' to a factor for better representation
patientInfo$overall_decision <- factor(patientInfo$overall_decision, levels = c(0, 1), labels = c("Good", "Bad"))

# Display the modified data frame
print(patientInfo)

# Just looking at the table, it doesn't look like the medical professionals
# made stellar decisions but let's see how this situation looks plotted.

# Use ggplot2 and reshape2 library to generate boxplots and histograms
library(ggplot2)

# Boxplot
ggplot(patientInfo, aes(x = overall_decision, y = bloodp)) + geom_boxplot()

# Histogram
ggplot(patientInfo, aes(x = bloodp, fill = overall_decision)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.7)
