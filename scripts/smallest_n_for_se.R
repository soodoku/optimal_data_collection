# Optimal Allocation
# When wa, vara, varb, and n are known, what is the optimal allocation across groups?

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

optimal_n_plus_allocation <- function(wa, vara, varb, se){
 
 n = (wa^2*vara + 2*wa*(1 - wa)*sqrt(vara*varb) + (1 - wa)^2*varb)/se^2
 ns <- optimal_allocation(wa, vara, varb, n)

 return(c(n = round(n, 0), na = round(ns[1], 0), nb = round(ns[2], 0)))
}

optimal_n_plus_allocation(.6, .24, .21, .015)

## Benefit of Using Optimal Allocation Rules
## wa = .8
## vara = .25; pa = .5
## varb = .16; pb = .8
## SRS: pop_mean of .8*.5 + .2*.8 = .56
   
# sqrt(p(1 -p)/n) = .015
# n = p*(1- p)/.015^2 = 1095

# optimal_n_plus_allocation(.8, .25, .16, .015)
#   n   na   nb 
#1024  853  171 

