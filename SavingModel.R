# Load the necessary libraries
library(cluster)

# Load the dataset
CustomerData <- read.csv("data/Customers.csv", colClasses = c(
  CustomerId = "numeric",
  Gender = "factor",
  Age = "numeric",
  Annual_Income = "numeric",
  Spending_Score = "numeric"
))

# Set a seed for reproducibility
set.seed(123)

# Select relevant features for clustering
clustering_features <- CustomerData[, c("Annual_Income", "Spending_Score")]

# Specify the number of clusters for k-means
num_clusters <- 5

# Calculate the Euclidean distance matrix
distances <- dist(clustering_features)

# Perform hierarchical clustering
hclust_model <- hclust(distances, method = "ward")

# Save the hclust model and the cut points
saveRDS(hclust_model, "./models/saved_hclust_model.rds")
saveRDS(num_clusters, "./models/saved_hclust_num_clusters.rds")

# Load the saved hclust model and num_clusters
loaded_hclust_model <- readRDS("./models/saved_hclust_model.rds")
loaded_num_clusters <- readRDS("./models/saved_hclust_num_clusters.rds")

# Cut the tree to get k clusters using loaded information
kmeans_clusters <- cutree(loaded_hclust_model, k = loaded_num_clusters)

# Create a new dataframe with cluster assignments
clustered_data <- cbind(CustomerData, Cluster = kmeans_clusters)

# Display the resulting dataframe
print(clustered_data)

