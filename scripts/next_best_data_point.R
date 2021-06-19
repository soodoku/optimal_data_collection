## From which strata to collect the next point?

# Two strata
# se = se of the sample mean 
# vara = variance of strata a
# varb = variance of strata b 
# wa = proportion of pop. that belongs to group a 

naive_strata_chooser <- function(wa, vara, varb, na, nb){

	se  <- sqrt(wa^2*vara/na + (1 - wa)^2*varb/nb)
	sea <- sqrt(wa^2*vara/(na + 1) + (1 - wa)^2*varb/nb)
	seb <- sqrt(wa^2*vara/na + (1 - wa)^2*varb/(nb + 1))

	if(se - sea == se - seb){
		return("choose from group a or group b")
	} 
	else if(se - sea > se - seb){
		return("choose from group a")
	}
	else {
		return("choose from group b")
	}
}

naive_strata_chooser(.6, .24, .21, 625, 387)
# [1] "choose from group b"
naive_strata_chooser(.6, .24, .21, 639, 673)
# [1] "choose from group a"

# Optimal Allocation Strata Chooser


# Optimal Allocation Formula
optimize(function(na, nb) {na + nb}, )
