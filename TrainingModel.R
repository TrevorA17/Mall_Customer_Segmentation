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
