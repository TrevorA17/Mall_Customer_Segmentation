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

#Measures of Central Tendency
# Display mean, median, and mode for Age
mean_age <- mean(CustomerData$Age)
median_age <- median(CustomerData$Age)
mode_age <- names(sort(-table(CustomerData$Age)))[1]

print("Measures of Central Tendency for Age:")
print(paste("Mean:", mean_age))
print(paste("Median:", median_age))
print(paste("Mode:", mode_age))

# Display mean, median, and mode for Annual Income
mean_income <- mean(CustomerData$Annual_Income)
median_income <- median(CustomerData$Annual_Income)
mode_income <- names(sort(-table(CustomerData$Annual_Income)))[1]

print("Measures of Central Tendency for Annual Income:")
print(paste("Mean:", mean_income))
print(paste("Median:", median_income))
print(paste("Mode:", mode_income))

# Display mean, median, and mode for Spending Score
mean_score <- mean(CustomerData$Spending_Score)
median_score <- median(CustomerData$Spending_Score)
mode_score <- names(sort(-table(CustomerData$Spending_Score)))[1]

print("Measures of Central Tendency for Spending Score:")
print(paste("Mean:", mean_score))
print(paste("Median:", median_score))
print(paste("Mode:", mode_score))

