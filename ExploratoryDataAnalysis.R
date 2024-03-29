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

#Measures of Distribution
# Display range for Age, Annual Income, and Spending Score
age_range <- range(CustomerData$Age)
income_range <- range(CustomerData$Annual_Income)
score_range <- range(CustomerData$Spending_Score)

print("Range for Age:")
print(age_range)

print("Range for Annual Income:")
print(income_range)

print("Range for Spending Score:")
print(score_range)

# Display standard deviation for Age, Annual Income, and Spending Score
sd_age <- sd(CustomerData$Age)
sd_income <- sd(CustomerData$Annual_Income)
sd_score <- sd(CustomerData$Spending_Score)

print("Standard Deviation for Age:")
print(sd_age)

print("Standard Deviation for Annual Income:")
print(sd_income)

print("Standard Deviation for Spending Score:")
print(sd_score)

# Display quantiles for Age, Annual Income, and Spending Score
quantiles_age <- quantile(CustomerData$Age)
quantiles_income <- quantile(CustomerData$Annual_Income)
quantiles_score <- quantile(CustomerData$Spending_Score)

print("Quantiles for Age:")
print(quantiles_age)

print("Quantiles for Annual Income:")
print(quantiles_income)

print("Quantiles for Spending Score:")
print(quantiles_score)

#Measures of Relationship
# Display correlation matrix
correlation_matrix <- cor(CustomerData[, c("Age", "Annual_Income", "Spending_Score")])
print("Correlation Matrix:")
print(correlation_matrix)

# Scatter plot matrix
pairs(CustomerData[, c("Age", "Annual_Income", "Spending_Score")], main = "Scatter Plot Matrix")

# Scatter plot between Annual Income and Spending Score
plot(CustomerData$Annual_Income, CustomerData$Spending_Score, main = "Scatter Plot: Annual Income vs Spending Score", 
     xlab = "Annual Income", ylab = "Spending Score", col = as.numeric(CustomerData$Gender))

# Add regression line to the scatter plot
abline(lm(Spending_Score ~ Annual_Income, data = CustomerData), col = "red")

#ANOVA
# Perform ANOVA for Age, Annual Income, and Spending Score based on Gender
anova_age <- aov(Age ~ Gender, data = CustomerData)
anova_income <- aov(Annual_Income ~ Gender, data = CustomerData)
anova_score <- aov(Spending_Score ~ Gender, data = CustomerData)

# Display ANOVA results
print("ANOVA for Age:")
print(summary(anova_age))

print("ANOVA for Annual Income:")
print(summary(anova_income))

print("ANOVA for Spending Score:")
print(summary(anova_score))

#Univariate Plots
# Load the necessary libraries
library(ggplot2)
# Univariate plot for Age - Histogram
ggplot(CustomerData, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Age", x = "Age", y = "Frequency")

# Univariate plot for Annual Income - Boxplot
ggplot(CustomerData, aes(x = 1, y = Annual_Income, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Boxplot of Annual Income", x = "", y = "Annual Income") +
  scale_fill_manual(values = c("pink", "lightblue"))

# Univariate plot for Spending Score - Density Plot
ggplot(CustomerData, aes(x = Spending_Score, fill = Gender)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Spending Score", x = "Spending Score", y = "Density") +
  scale_fill_manual(values = c("pink", "lightblue"))

#MultiVariate Plots
# Load the necessary libraries
library(ggplot2)

# Multivariate scatter plot matrix
ggplot(CustomerData, aes(x = Age, y = Annual_Income, color = Gender)) +
  geom_point() +
  labs(title = "Scatter Plot Matrix", x = "Age", y = "Annual Income") +
  theme_minimal()

# Multivariate scatter plot for Spending Score vs. Annual Income
ggplot(CustomerData, aes(x = Annual_Income, y = Spending_Score, color = Gender)) +
  geom_point() +
  labs(title = "Scatter Plot: Spending Score vs. Annual Income", x = "Annual Income", y = "Spending Score") +
  theme_minimal()

# Multivariate 3D scatter plot
library(plotly)

plot_ly(
  data = CustomerData,
  x = ~Age,
  y = ~Annual_Income,
  z = ~Spending_Score,
  color = ~Gender,
  type = "scatter3d",
  mode = "markers"
) %>%
  layout(scene = list(xaxis = list(title = "Age"),
                      yaxis = list(title = "Annual Income"),
                      zaxis = list(title = "Spending Score"),
                      aspectmode = "manual",
                      aspectratio = list(x = 1, y = 1, z = 0.5))
  )
