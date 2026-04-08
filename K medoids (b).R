
install.packages("cluster")       
install.packages("ggplot2")       
install.packages("factoextra")   
library(cluster) 
library(ggplot2) 
library(factoextra) 

data <- iris  
head(data)    

iris_data <- data[, c("Petal.Length", "Petal.Width")] 
 
ggplot(iris_data, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point(color = "blue", size = 3) + 
  ggtitle("Before Clustering: Raw Data") + 
  xlab("Petal Length") + 
  ylab("Petal Width") + 
  theme_minimal() 

k <- 3  
kmedoids_result <- pam(iris_data, k = k) 
 
cluster_labels <- c("Setosa", "Versicolor", "Virginica") 

iris_data$Cluster <- factor(kmedoids_result$cluster, labels = cluster_labels) 

ggplot(iris_data, aes(x = Petal.Length, y = Petal.Width, color = Cluster)) + 
  geom_point(size = 3) + 
  geom_point(data = as.data.frame(kmedoids_result$medoids), aes(x = Petal.Length, y = 
                                                                  Petal.Width), color = "red", size = 5, shape = 8) + 
  ggtitle(paste("After Clustering: K-Medoids (K =", k, ")")) + 
  xlab("Petal Length") + 
  ylab("Petal Width") + 
  theme_minimal() 

iris_data$Actual_Species <- data$Species   
confusion_matrix <- table(Predicted_Cluster = iris_data$Cluster,
                          Actual_Species = iris_data$Actual_Species)
        print("Comparison of Predicted Clusters with Actual Species:") 
      print(confusion_matrix) 
      
      print("Medoid Centers:") 
      print(kmedoids_result$medoids) 
     
      print("Cluster Assignments:") 
      print(iris_data[, c("Petal.Length", "Petal.Width", "Cluster")])  