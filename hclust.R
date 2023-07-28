
library(factoextra)

iris.label <- iris$Species
table(iris.label)

# Data
iris_data = iris[1:4]

# Scale:
iris_data_std = scale(iris_data)

# Distance
iris.dist = dist(iris_data_std)

# Hierarchial clustering 
hc.out_iris <- hclust(iris.dist, method="complete")
hc.out_iris

#Dendrogram
plot(hc.out_iris)
rect.hclust(hc.out_iris, k=3, border= 2:5)

# cluster
iris.clusters <- cutree(hc.out_iris, k=3)

# visualize the cluster
rownames(iris_data_std) <- paste(iris$Species, 1:dim(iris)[1], sep="_")
fviz_cluster(list(data=iris_data_std, cluster= iris.clusters))
table(iris.clusters, iris$Species)

