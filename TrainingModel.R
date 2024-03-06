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


# Load the necessary libraries
install.packages("caret")
library(caret)

# Set a seed for reproducibility
set.seed(123)

# Specify the number of folds for cross-validation
num_folds <- 5

# Create a training control object for cross-validation
train_control <- trainControl(method = "cv", number = num_folds)

# Train a model (linear regression) using cross-validation
model <- train(Spending_Score ~ Age + Annual_Income + Gender, data = CustomerData, method = "lm", trControl = train_control)

# Display the cross-validation results
print("Cross-Validation Results:")
print(model$results)

# Model Training
# Load the necessary libraries
# install.packages("ggplot2")
library(ggplot2)

# Load the dataset
# Select relevant features for clustering
features <- CustomerData[, c("Annual_Income", "Spending_Score")]

# Set a seed for reproducibility
set.seed(123)

# Determine the optimal number of clusters (K) using the elbow method
wss <- numeric(10)
for (i in 1:10) {
  kmeans_model <- kmeans(features, centers = i, nstart = 10)
  wss[i] <- sum(kmeans_model$withinss)
}

# Plot the elbow curve
plot(1:10, wss, type = "b", pch = 19, frame = FALSE, main = "Elbow Method for Optimal K",
     xlab = "Number of Clusters (K)", ylab = "Within-cluster Sum of Squares (WSS)")

# Determine the optimal K visually (elbow point)
optimal_k <- 3  # Replace with the visually determined optimal K

# Apply K-means clustering with the optimal K
kmeans_model <- kmeans(features, centers = optimal_k, nstart = 10)

# Add cluster information to the original dataset
CustomerData$Cluster <- as.factor(kmeans_model$cluster)

# Plot the clusters
ggplot(CustomerData, aes(x = Annual_Income, y = Spending_Score, color = Cluster)) +
  geom_point() +
  labs(title = "Customer Segmentation", x = "Annual Income", y = "Spending Score") +
  theme_minimal()

