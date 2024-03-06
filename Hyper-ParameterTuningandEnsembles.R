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

# Load the necessary libraries
library(cluster)
library(fpc)



# Set a seed for reproducibility
set.seed(123)

# Select relevant features for clustering
clustering_features <- CustomerData[, c("Annual_Income", "Spending_Score")]

# Specify the number of clusters for PAM
num_clusters <- 3

# Try different linkage methods for hierarchical clustering
linkage_methods <- c("single", "complete", "average", "ward")

# Evaluate clustering quality using silhouette width for each method
for (method in linkage_methods) {
  hclust_model <- hclust(dist(clustering_features), method = method)
  pam_model <- pam(hclust_model, k = num_clusters)
  
  silhouette_width <- silhouette(pam_model$cluster, dist(clustering_features))
  
  cat("Linkage Method:", method, "\tSilhouette Width:", mean(silhouette_width[, 3]), "\n")
}
