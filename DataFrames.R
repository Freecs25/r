
students <- data.frame( 
  StudentID = 1:5, 
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"), 
  Age = c(20, 22, 23, 21, 22), 
  Marks = c(85, 90, 78, 88, 95), 
  Passed = c(TRUE, TRUE, TRUE, TRUE, TRUE) 
) 
print("Step 1: DataFrame Created") 
print(students) 
 
print("\nStep 2: Accessing Data") 
print("Access the first row:") 
print(students[1, ]) 
print("Access the 'Name' column:") 
print(students$Name) 
print("Access specific data (Marks of 3rd student):") 
print(students[3, "Marks"]) 
 
print("\nStep 3: Adding a New Column") 
students$Grade <- c("A", "A+", "B", "A", "A+") 
print("DataFrame after adding 'Grade' column:") 
print(students) 

print("\nStep 4: Adding a New Row") 
new_row <- data.frame(StudentID = 6, Name = "Frank", Age = 23, Marks = 80, Passed = TRUE, 
                      Grade = "B+") 
students <- rbind(students, new_row) 
print("DataFrame after adding a new row:") 
print(students) 

print("\nStep 5: Removing a Column") 
students$Passed <- NULL 
print("DataFrame after removing the 'Passed' column:") 
print(students) 
 
print("\nStep 6: Summary Statistics") 
print("Summary of the 'Marks' column:") 
print(summary(students$Marks)) 
 
print("\nStep 7: Handling Missing Data") 
students$Marks[4] <- NA  
print("DataFrame with a missing value:") 
print(students) 
print("Replacing missing values with the column mean:") 
students$Marks[is.na(students$Marks)] <- mean(students$Marks, na.rm = TRUE) 
print(students) 

print("\nStep 8: Filtering Data") 
print("Filter students with Marks > 85:") 
filtered_students <- subset(students, Marks > 85) 
print(filtered_students) 

print("\nStep 9: Sorting Data") 
print("Sort students by Age in descending order:") 
sorted_students <- students[order(-students$Age), ] 
print(sorted_students) 
 
print("\nStep 10: Saving and Loading Data") 
write.csv(students, "students.csv", row.names = FALSE) 
print("DataFrame saved to 'students.csv'.") 
loaded_students <- read.csv("students.csv") 
print("DataFrame loaded from 'students.csv':") 
print(loaded_students) 