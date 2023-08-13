# K-Means Clustering with Sum of Squares Metrics

This repository contains R code for performing k-means clustering on a given dataset and calculating the Within-Cluster Sum of Squares (WCSS), Total Sum of Squares (TSS), and Between-Cluster Sum of Squares (BSS) metrics.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Functions](#functions)
- [Requirements](#requirements)
- [Installation](#installation)

## Introduction

The `kmeans_clustering.R` script demonstrates k-means clustering, a common technique used to partition data points into clusters. The script calculates the WCSS, TSS, and BSS metrics, which provide insights into the quality and effectiveness of the clustering.

## Usage

1. Make sure you have R installed on your system.

2. Clone this repository or download the `kmeans_clustering.R` script.

3. Open the script in an R-compatible environment (e.g., RStudio or R command line).

4. Run the script to perform k-means clustering and calculate WCSS, TSS, and BSS metrics on a synthetic dataset.

5. The calculated metrics and clustering results will be printed to the console.

## Functions

The script includes the following functions:

- `euclidean_distance(x1, x2)`: Computes the Euclidean distance between two vectors, `x1` and `x2`.

- `assign_clusters(data, centroids)`: Assigns each data point to the nearest centroid based on Euclidean distance.

- `update_centroids(data, clusters, k)`: Updates centroids by calculating the mean of data points in each cluster.

- `calculate_wcss(data, clusters, centroids)`: Calculates the Within-Cluster Sum of Squares (WCSS) metric, representing the variability of data points within their clusters.

- `calculate_tss(data)`: Computes the Total Sum of Squares (TSS) metric, which measures the total variability of data points from the centroid.

- `kmeans(data, k, max_iter = 100)`: Performs k-means clustering, returning clustering results and calculated metrics.

## Requirements

To run the script, you need:

- R (https://www.r-project.org/)

## Installation

1. Install R by following the instructions on the [R Project website](https://www.r-project.org/).

2. Open an R-compatible environment (e.g., RStudio).

3. Clone this repository or download the `kmeans_clustering.R` script.

4. Open the script in your preferred R environment and run it to perform k-means clustering and calculate metrics.

## The Output

When you run the script, you'll see output similar to the following:

```R
WCSS:  71.14859
TSS:   175.0613
BSS:   0.593579
```

These values provide insights into the quality of the clustering and the distribution of data points.

