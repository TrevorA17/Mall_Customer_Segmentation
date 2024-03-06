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

# Check for missing values
missing_values <- sum(is.na(CustomerData))

# Display confirmation
if (missing_values > 0) {
  print("Missing values are present in the dataset.")
  print(paste("Total missing values: ", missing_values))
  print("Columns with missing values:")
  print(names(CustomerData)[colSums(is.na(CustomerData)) > 0])
} else {
  print("No missing values are present in the dataset.")
}

# Data transformations

# Standardizing numeric variables (Age, Annual_Income, Spending_Score)
numeric_cols <- c("Age", "Annual_Income", "Spending_Score")
CustomerData[numeric_cols] <- scale(CustomerData[numeric_cols])

# Creating a new feature (Age category)
CustomerData$Age_Category <- cut(CustomerData$Age, breaks = c(0, 30, 50, Inf), labels = c("Young", "Middle-aged", "Senior"))

# Display the transformed dataset
head(CustomerData)