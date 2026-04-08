
students <- data.frame( 
  StudentID = 1:10, 
  Marks = c(78, 85, 62, 90, 88, 75, 80, 68, 95, 84), 
  Age = c(20, 21, 20, 22, 21, 20, 22, 19, 23, 21) 
) 
print("Dataset:") 
print(students) 

mean_marks <- mean(students$Marks) 
mean_age <- mean(students$Age) 
print(paste("Mean Marks:", mean_marks)) 
print(paste("Mean Age:", mean_age)) 

median_marks <- median(students$Marks) 
median_age <- median(students$Age) 
print(paste("Median Marks:", median_marks)) 
print(paste("Median Age:", median_age)) 

get_mode <- function(x) { 
  uniq_vals <- unique(x) 
  uniq_vals[which.max(tabulate(match(x, uniq_vals)))] 
} 

mode_marks <- get_mode(students$Marks) 
mode_age <- get_mode(students$Age) 
print(paste("Mode Marks:", mode_marks)) 
print(paste("Mode Age:", mode_age)) 

variance_marks <- var(students$Marks) 
print(paste("Variance of Marks:", variance_marks)) 
 
std_dev_marks <- sd(students$Marks) 
print(paste("Standard Deviation of Marks:", std_dev_marks)) 

summary_stats <- summary(students) 
print("Summary Statistics:") 
print(summary_stats) 

hist( 
  students$Marks, 
  main = "Histogram of Marks", 
  xlab = "Marks", 
  col = "lightblue", 
  border = "black" 
) 

boxplot( 
  students$Marks, 
  main = "Boxplot of Marks", 
  ylab = "Marks", 
  col = "lightgreen" 
)