
matrix1 <- matrix(1:9, nrow = 3, ncol = 3) 
print("Matrix 1 (3x3 filled column-wise):") 
print(matrix1) 
matrix2 <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE) 
print("Matrix 2 (2x3 filled row-wise):") 
print(matrix2) 
row1 <- c(1, 2, 3) 
row2 <- c(4, 5, 6) 
matrix3 <- rbind(row1, row2) 
print("Matrix 3 (using rbind):") 
print(matrix3) 
col1 <- c(1, 4) 
col2 <- c(2, 5) 
matrix4 <- cbind(col1, col2) 
print("Matrix 4 (using cbind):") 
print(matrix4) 
 
print(matrix2[2, 3]) 
print(matrix2[2, ]) 
print(matrix1[, 3]) 

matrix1[1, 1] <- 10 
matrix2[2, ] <- c(7, 8, 9) 

matrix_add <- matrix1 + matrix(9:1, 3, 3) 
matrix_mult <- matrix1 * 2 
matrix_dot <- matrix1 %*% t(matrix1) 

t(matrix1) 
rowSums(matrix1) 
colSums(matrix1) 
rowMeans(matrix1) 
colMeans(matrix1) 

matrix1 > 5 

matrix2 <- matrix(1:9, nrow = 3, ncol = 3)
matrix_combined <- cbind(matrix1, matrix2[,1])


diag_matrix <- diag(1, nrow = 3, ncol = 3) 
custom_diag <- diag(c(1, 2, 3)) 

sub_matrix <- matrix1[1:2, 2:3] 
 
det_matrix <- det(matrix1) 
inv_matrix <- solve(diag_matrix) 
 
dim(matrix1) 
nrow(matrix1) 
ncol(matrix1)