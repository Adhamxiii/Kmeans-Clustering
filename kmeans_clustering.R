euclidean_distance <- function(x1, x2) {
  sqrt(sum((x1 - x2)^2))
}

assign_clusters <- function(data, centroids) {
  num_points <- nrow(data)
  num_clusters <- nrow(centroids)
  clusters <- numeric(num_points)
  for (i in 1:num_points) {
    min_distance <- Inf
    for (j in 1:num_clusters) {
      distance <- euclidean_distance(data[i, ], centroids[j, ])
      if (distance < min_distance) {
        min_distance <- distance
        clusters[i] <- j
      }
    }
  }
  clusters
}

update_centroids <- function(data, clusters, k) {
  num_features <- ncol(data)
  centroids <- matrix(0, nrow = k, ncol = num_features)
  for (i in 1:k) {
    cluster_points <- data[clusters == i, ]
    centroids[i, ] <- colMeans(cluster_points)
  }
  centroids
}

calculate_wcss <- function(data, clusters, centroids) {
  num_points <- nrow(data)
  wcss <- 0

  for (i in 1:num_points) {
    cluster_index <- clusters[i]
    distance <- euclidean_distance(data[i, ], centroids[cluster_index, ])
    wcss <- wcss + distance^2
  }

  wcss
}

calculate_tss <- function(data) {
  centroid <- colMeans(data)
  num_points <- nrow(data)
  tss <- 0

  for (i in 1:num_points) {
    distance <- euclidean_distance(data[i, ], centroid)
    tss <- tss + distance^2
  }

  tss
}

kmeans <- function(data, k, max_iter = 100) {
  num_points <- nrow(data)
  num_features <- ncol(data)
  set.seed(123)
  centroids <- matrix(runif(k * num_features), nrow = k, ncol = num_features)
  clusters <- rep(0, num_points)
  for (iter in 1:max_iter) {
    prev_clusters <- clusters
    clusters <- assign_clusters(data, centroids)
    centroids <- update_centroids(data, clusters, k)
    if (all(prev_clusters == clusters)) {
      break
    }
  }
  wcss <- calculate_wcss(data, clusters, centroids)
  tss <- calculate_tss(data)

  list(clusters = clusters, centroids = centroids, wcss = wcss, tss = tss)
}


set.seed(123)
data <- matrix(rnorm(200), ncol = 2)
k <- 3
result <- kmeans(data, k)
cat("WCSS:", result$wcss, "\n")
cat("TSS:", result$tss, "\n")
cat("BSS:", (result$tss - result$wcss) / result$tss, "\n")
result$clusters
result$centroids
