 
list_example <- list( 
  numbers = c(1, 2, 3, 4),                   

  words = c("apple", "banana", "cherry"),   
  logicals = c(TRUE, FALSE, TRUE)            

) 
print("Original List:") 
print(list_example) 

print("Access by index (first element):") 
print(list_example[[1]]) 

print("Access by name (words):") 
print(list_example$words) 

print("Access specific value in words (second element):") 
print(list_example$words[2]) 
 
list_example$numbers <- c(10, 20, 30)  
print("Modified List (numbers replaced):") 
print(list_example) 

list_example$new_component <- "Hello, R!"   
print("List after adding a new component:") 
print(list_example) 

list_example$new_component <- NULL   
print("List after removing the new component:") 
print(list_example) 

list_combined <- c(list_example, list(additional = c(100, 200))) 
print("Combined List:") 
print(list_combined) 

print("Length of each component in the list:") 
print(lapply(list_example, length)) 
 
print("Length of each component (simplified):") 
print(sapply(list_example, length)) 

nested_list <- list( 
  first = list(a = 1, b = 2), 
  second = list(c = "hello", d = "world") 
) 
print("Nested List:") 
print(nested_list) 

print("Access nested element (second$c):") 
print(nested_list$second$c) 
 
flat_vector <- unlist(list_example$numbers) 
print("Unlisted numeric vector:") 
print(flat_vector) 

print("Checking structure of the list:") 
str(list_example) 
print("Iterating over the list:") 
for (item in list_example) { 
  print(item) 
} 

selected_components <- list_example[c("numbers", "words")] 
print("Selected components (numbers and words):") 
print(selected_components) 

print("Summary of the numbers component:") 
print(summary(list_example$numbers)) 