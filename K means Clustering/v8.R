 
install.packages("ggplot2")       

install.packages("factoextra")    
library(ggplot2) 
library(factoextra) 
 
data <- read.csv("customers.csv") 

head(data) 
 
customer_data <- data[, c("Annual_Income", "Spending_Score")] 
 
fviz_nbclust(customer_data, kmeans, method = "wss") + 
  ggtitle("Elbow Method for Optimal K") 

set.seed(123) 
k_value <- 5 
kmeans_result <- kmeans(customer_data, centers = k_value, nstart = 25) 

customer_data$Cluster <- as.factor(kmeans_result$cluster) 

ggplot(customer_data, aes(x = Annual_Income, y = Spending_Score, color = Cluster)) + 
  geom_point(size = 3) + 
  geom_point(data = as.data.frame(kmeans_result$centers), aes(x = Annual_Income, y = 
                                                                Spending_Score), color = "red", size = 5, shape = 8) + 
  ggtitle("K-Means Clustering of Customers") + 
  xlab("Annual Income") + 
  ylab("Spending Score") + 
  theme_minimal() 

print("Cluster Centers:") 
print(kmeans_result$centers) 

print("Cluster Assignments:") 
print(kmeans_result$cluster) 