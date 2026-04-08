
if (!require("e1071")) install.packages("e1071") 
if (!require("caret")) install.packages("caret") 
if (!require("ggplot2")) install.packages("ggplot2") 
library(e1071) 
library(caret) 
library(ggplot2) 

data <- read.csv("loan_dataset.csv", na.strings = "?") 
 
data <- data[complete.cases(data), ]

data$Loan_Status <- factor(ifelse(data$Loan_Status == "Y", 1, 0))
 
data$Dependents <- as.character(data$Dependents) 
data$Dependents[data$Dependents == "3+"] <- "4" 
data$Dependents <- as.numeric(data$Dependents) 
data$Married <- ifelse(data$Married == "Yes", 1, 0) 
data$Self_Employed <- ifelse(data$Self_Employed == "Yes", 1, 0) 
data$Education <- ifelse(data$Education == "Graduate", 1, 0) 
data$Property_Area <- factor(data$Property_Area, levels = c("Rural", "Semiurban", "Urban")) 
data$Property_Area <- as.numeric(data$Property_Area) - 1 


data <- subset(data, select = -c(Loan_ID, Gender)) 


set.seed(42) 
train_index <- createDataPartition(data$Loan_Status, p = 0.95, list = FALSE)
train_data <- data[train_index, ] 
test_data <- data[-train_index, ] 

train_features <- subset(train_data, select = -Loan_Status) 
train_labels <- train_data$Loan_Status 
test_features <- subset(test_data, select = -Loan_Status) 
test_labels <- test_data$Loan_Status 
 
svm_model <- svm(Loan_Status ~ ., data = train_data, kernel = "linear") 


test_predictions <- predict(svm_model, test_features) 


conf_matrix <- table(Predicted = test_predictions, Actual = test_labels) 
print("Confusion Matrix:") 
print(conf_matrix) 


total_predictions <- sum(conf_matrix) 
expected_test_size <- length(test_labels) 
cat("Total Predictions in Confusion Matrix:", total_predictions, "\n") 
cat("Expected Test Set Size:", expected_test_size, "\n") 


accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix) * 100 
cat("Model Accuracy:", round(accuracy, 2), "%\n") 
 
new_customer1 <- data.frame(Married = 1, Dependents = 1, Education = 1, Self_Employed = 1, 
                            ApplicantIncome = 12841, CoapplicantIncome = 10968, LoanAmount = 349, 
                            Loan_Amount_Term = 360, Credit_History = 1, Property_Area = 1) 

new_customer2 <- data.frame(Married = 1, Dependents = 1, Education = 1, Self_Employed = 0, 
                            ApplicantIncome = 300, CoapplicantIncome = 30000, LoanAmount = 39, 
                            Loan_Amount_Term = 30, Credit_History = 0, Property_Area = 1) 
 
prediction1 <- predict(svm_model, new_customer1) 
prediction2 <- predict(svm_model, new_customer2) 


cat("Prediction for New Customer 1: ", ifelse(prediction1 == 1, "Loan Approved", "Loan Rejected"), "\n") 
cat("Prediction for New Customer 2: ", ifelse(prediction2 == 1, "Loan Approved", "Loan Rejected"), "\n") 