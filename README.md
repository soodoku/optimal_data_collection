## Optimal Data Collection

* What's the next best data point to collect when know the strata and strata variances?

    Let’s say that once again we want to measure support for Mr. Obama. Let's assume that we have information about different strata in the population and know the variability of the response in each stratum. Let's say that our objective is to estimate the population mean with the smallest confidence interval. If I could collect only one additional data point, which strata would I sample from? The greater reduction in error will come from collecting data from the stratum where the responses are the most unpredictable, pro-rated by how big the stratum is.

    * [Script](scripts/next_best_data_point.R)

* What's the least amount of data we need to collect (and how) to estimate mean with a particular s.e. when know the strata and strata variances?

    Let's say that we are interested in estimating the population mean within a particular error bound. Let's assume that there are two strata in the population: $a$ and $b$. Let's assume that the proportion of a in the population is $w_a$ and the proportion of $b$ is $1 - w_a$. The corresponding standard deviation for $a$ and $b$ is $s_a$ and $s_b$.

    $se = \sqrt(\frac{wa^2*vara}{na} + \frac{(1-wa)^2*varb}{nb})$

    $na = \frac{n*wa*\sqrt{vara}}{wa*\sqrt{vara} + (1 - wa)*\sqrt{varb}}$

    $nb = \frac{n*wb*\sqrt{varb}}{wa*\sqrt{vara} + (1 - wa)*\sqrt{varb}}$

    $n  = \frac{wa^2*vara + 2*wa*(1 - wa)*sqrt(vara*varb) + (1 - wa)^2*varb}{se^2}$

    * [Script](scripts/smallest_n_for_se.R)


### Authors

Ken Cor and Gaurav Sood
