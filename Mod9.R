# LIS 4370 R Programming - Module 9 Assignment (Data Visualization in R)

# Generate 3 types of visualizations on the data you chosen

# Packages
library(lattice)
library(ggplot2)

pizzaPlace <- read.csv("C:/Users/ktbur/Documents/USF/Spring2024_ClassFolders/LIS4370_R_Programming/Week9/pizzaplace.csv")

str(pizzaPlace)
is.na(pizzaPlace)

# Visual 1 - Using Base R
# Create histogram of prices
hist(pizzaPlace$price, main = "Distribution of Pizza Prices", xlab = "Price", col = "indianred1", border = "black")

# Create pie chart

# Check occurrences of each pizza type
type_counts <- table(pizzaPlace$type)

pie(type_counts, main = "Distribution of Pizza Type", col = rainbow(length(type_counts)))

# Add legend
legend("topright", legend = names(type_counts), fill = rainbow(length(type_counts)), cex = 1.25)

# Visual 2 - Using the Lattice package
# Explore relationship between prices and pizza size

# Convert size to factor
pizzaPlace$size <- factor(pizzaPlace$size, levels = c("S", "M", "L"))

# Create lattice plot
bwplot(price ~ size, data = pizzaPlace, main = "Price Distribution by Size", xlab = "Size", ylab = "Price", col = "goldenrod2")

xyplot(price ~ size, pizzaPlace, cex = 2, grid = TRUE, main = "Price Distribution by Size", xlab = "Size", ylab = "Price", col = "indianred1")


# Visual 3 - Using the ggplot2 package
# Plot pizza lines over time using geom_line

# Convert date to Date format
pizzaPlace$date <- as.Date(pizzaPlace$date, format = "%Y-%m-%d")

# Create line chart using ggplot2
ggplot(pizzaPlace, aes(x = date, y = price)) +
  geom_line(color = "palegreen1") + 
  labs(title = "Total Sales Over Time", x = "Date", y = "Price")

# Separate data into facets to make it easier to compare trends
ggplot(pizzaPlace, aes(x = date, y = price, group = type, color = type)) + 
  geom_line() + facet_wrap(~type, scales = "free_y") + 
  labs(title = "Sales Over Time by Pizza Type", x = "Date", y = "Price")

# Summarize data by date and use bar chart
summarized_data <- aggregate(price ~ date, pizzaPlace, sum)

# Bar chart of total sales per date
ggplot(summarized_data, aes(x = date, y = price, fill = date)) +
  geom_bar(stat = "identity") + 
  labs(title = "Total Sales Over Time (Aggregated)", x = "Date", y = "Total Sales") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Show trend via smoothed line chart
ggplot(pizzaPlace, aes(x = date, y = price, color = type)) + 
  geom_smooth() + labs(title = "Smoothed Sales Over Time", x = "Date", y = "Price")