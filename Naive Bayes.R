 
install.packages("e1071")   
library(e1071)   

install.packages("caTools") 
library(caTools) 

data <- data.frame( 
  Age = factor(c("<=30", "<=30", "31...40", ">40", ">40", ">40", "31...40", "<=30", "<=30", ">40", "<=30", 
                 "31...40", "31...40", ">40")), 
  Income = factor(c("High", "High", "High", "Medium", "Low", "Low", "Low", "Medium", "Low", "Medium", 
                    "Low", "Medium", "High", "Medium")), 
  Student = factor(c("No", "No", "No", "No", "Yes", "Yes", "Yes", "No", "Yes", "Yes", "Yes", "No", "Yes", 
                     "No")), 
  Credit_rating = factor(c("Fair", "Excellence", "Fair", "Fair", "Fair", "Excellence", "Excellence", "Fair", "Fair", 
                           "Fair", "Fair", "Excellence", "Fair", "Excellence")),  
  Buys_computer = factor(c("No", "No", "Yes", "Yes", "Yes", "No", "Yes", "No", "Yes", "Yes", "Yes", "Yes", 
                           "Yes", "No")) 
) 
 
set.seed(123)  
split <- sample.split(data$Buys_computer, SplitRatio = 0.7)   
train_set <- subset(data, split == TRUE) 
test_set <- subset(data, split == FALSE) 
 
model <- naiveBayes(Buys_computer ~ ., data = train_set) 
print(model) 

test_predictions <- predict(model, newdata = test_set) 

conf_matrix <- table(Predicted = test_predictions, Actual = test_set$Buys_computer) 
print("Confusion Matrix:") 
print(conf_matrix) 
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix) 
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%")) 

new_customer <- data.frame( 
  Age = factor("<=30", levels = levels(data$Age)), 
  Income = factor("Medium", levels = levels(data$Income)), 
  Student = factor("Yes", levels = levels(data$Student)), 
  Credit_rating = factor("Fair", levels = levels(data$Credit_rating)) 
) 

prediction <- predict(model, newdata = new_customer) 
print(paste("Prediction for new customer:", prediction)) 

probabilities <- predict(model, newdata = new_customer, type = "raw") 
print("Probabilities for new customer:") 
print(probabilities) 