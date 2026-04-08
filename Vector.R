
numeric_vec <- c(10, 20, 30, 40) 
char_vec <- c("R", "Programming", "Vector") 
logical_vec <- c(TRUE, FALSE, TRUE, FALSE) 
seq_vec <- seq(1, 10, by = 2) 
rep_vec <- rep(5, times = 4) 

first_element <- numeric_vec[1] 
subset_elements <- numeric_vec[2:4] 
specific_elements <- numeric_vec[c(1, 3)] 
exclude_element <- numeric_vec[-2] 
logical_indexing <- numeric_vec[logical_vec] 

numeric_vec[2] <- 25 
numeric_vec <- c(numeric_vec, 50) 
 
vec_a <- c(1, 2, 3) 
vec_b <- c(4, 5, 6) 
addition <- vec_a + vec_b 
multiplication <- vec_a * vec_b 
scalar_multiplication <- vec_a * 2 
logical_comparison <- vec_a > 2 

vector_sum <- sum(numeric_vec) 
vector_mean <- mean(numeric_vec) 
vector_length <- length(numeric_vec) 
sorted_vector <- sort(numeric_vec) 
 
vec_short <- c(1, 2) 
recycled_operation <- vec_a + vec_short
vec_a + rep(vec_short, length.out = length(vec_a))
 
filtered_vec <- numeric_vec[numeric_vec > 20] 

combined_vec <- c(vec_a, vec_b) 
 
vec_with_na <- c(1, 2, NA, 4) 
na_removed <- na.omit(vec_with_na) 
na_check <- is.na(vec_with_na) 

sqrt_vec <- sqrt(numeric_vec) 
 
mixed_vec <- c(1, "two", TRUE) 