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

#Measures of Frequency
# Display the structure of the dataset
str(CustomerData)

# Display summary statistics
summary(CustomerData)

# Frequency table for Gender
gender_frequency <- table(CustomerData$Gender)
print("Frequency table for Gender:")
print(gender_frequency)

# Histogram for Age
hist(CustomerData$Age, main = "Histogram of Age", xlab = "Age")

# Histogram for Annual Income
hist(CustomerData$Annual_Income, main = "Histogram of Annual Income", xlab = "Annual Income")

# Histogram for Spending Score
hist(CustomerData$Spending_Score, main = "Histogram of Spending Score", xlab = "Spending Score")

