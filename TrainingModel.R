#Load Dataset

CustomerData <-read.csv("data/Customers.csv", colClasses = c(
  CustomerId = "numeric",
  Gender = "factor",
  Age = "numeric",
  Annual_Income = "numeric",
  Spending_Score = "numeric"
))

#View Dataset
View(CustomerData)

# Data Splitting
# Install and load the necessary libraries
install.packages("caret")
library(caret)

# Set a seed for reproducibility
set.seed(123)

# Specify the proportion for training and testing sets
split_ratio <- 0.8  # 80% for training, 20% for testing

# Split the data
splitIndex <- createDataPartition(CustomerData$Spending_Score, p = split_ratio, list = FALSE)
train_data <- CustomerData[splitIndex, ]
test_data <- CustomerData[-splitIndex, ]

# Display the dimensions of the split datasets
cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data), "\n")

#Bootstrapping
# Load the necessary libraries
install.packages("boot")
library(boot)


# Set a seed for reproducibility
set.seed(123)

# Function to calculate the mean of the variable of interest
calculate_mean <- function(data, indices) {
  sample_data <- data[indices, ]
  return(mean(sample_data$Spending_Score))
}

# Number of bootstrap samples
num_boot_samples <- 1000

# Perform bootstrapping
boot_results <- boot(data = CustomerData, statistic = calculate_mean, R = num_boot_samples)

# Display the bootstrap results
print("Bootstrap Results:")
print(boot_results)

# Plot the bootstrap distribution
hist(boot_results$t, main = "Bootstrap Distribution of Mean Spending_Score", xlab = "Mean Spending_Score")


