# Optimal Allocation

optimal_allocation <- function(wa, vara, varb, n) {

	num <- n*wa*sqrt(vara)
	den <- wa*sqrt(vara) + (1 - wa)*sqrt(varb)
	na  <- num/den 
	nb  <- n - na

	return(round(c(na, nb), 0))
}

optimal_allocation(.6, .24, .21, 9107)
# [1] 2695 6412

# Solve for na, nb when se, vara, varb, wa are given
# via https://towardsdatascience.com/how-to-solve-a-constraint-optimization-problem-in-r-fdf5abee197b
# Using nloptr
library(nloptr)

wa = .6 
vara = .24 
varb = .21
se = .015

# objective function
eval_f0 <- function(x){
	return(x[1] + x[2])
}

# constraint function
eval_g0 <- function(x) {
	return(sqrt(wa^2*vara/x[1] + (1 - wa)^2*varb/x[2]) - se)
}

# Solve using NLOPT_LN_COBYLA without gradient information
res1 <- nloptr(x0 = c(100, 100),
		       eval_f=eval_f0,
		       eval_g_ineq = eval_g0,
		       opts = list("algorithm"="NLOPT_LN_COBYLA", "xtol_rel"=1.0e-8))

res1$solution

# Assume that the optimal allocation formula is known
# Solve for n and use optimal allocation for na/nb
