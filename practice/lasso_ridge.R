install.packages("Matrix")
library(Matrix)
(A <- matrix(c(4, 3, -2, 5, 2, -4, 6, 1, -1, 2, -5, 6, 3, 5, -2, -3), nrow = 4))
(B <- matrix(c(16.9, -14, 25, 9.4), nrow = 4))

luA <- lu(A)
elu <- expand(luA)
(L <- elu$L)
(U <- elu$U)
(P <- elu$P)

(Y <- solve(L) %*% P %*% B)
(X <- solve(U) %*% Y)