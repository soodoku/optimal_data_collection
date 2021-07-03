## Optimal Data Collection

What's the least amount of data you need to collect to estimate a parameter with a particular standard error? For the simplest case---estimating the mean of a bionomial variable using a simple random sampling, a conservative estimate of variance (p = .5), and a +/- 3% confidence interval---the answer (n $\sim$ 1,000) is well known. Often, however, we know more. In opinion polling, we generally know the sociodemographic strata in the population. And we have historical data on the variability in strata. Take, for instance, measuring support for Mr. Obama. A polling company like YouGov will usually have a long time series on it including information about respondent characteristics. And from this data, the company could derive how variable the support for Mr. Obama is among different groups. Using these data, the company may ask---what's the fewest people it needs to poll for the s.e.? In this note, we answer how to capitalize on such information.       

### What's the least amount of data we need to collect (and how) to estimate mean with a particular s.e. when know the strata and strata variances?

Let's say that we are interested in estimating the population mean within a particular error bound. Let's assume that there are two strata in the population: $a$ and $b$. Let's assume that the proportion of a in the population is $w_a$ and the proportion of $b$ is $1 - w_a$. The corresponding standard deviation for $a$ and $b$ is $\sigma_a$ and $\sigma_b$. And let's assume that the sample size of the groups is denoted by $n_a$ and $n_b$. 

$se = \sqrt{\frac{w_a^2*\sigma_a^2}{n_a} + \frac{(1 - w_a)^2*\sigma_b^2}{n_b}}$

$n_a = \frac{n w_a \sqrt{\sigma_a^2}}{w_a \sqrt{\sigma_a^2} + (1 - w_a) \sqrt{\sigma_b^2}}$

$n_b = \frac{n*w_b*\sqrt{\sigma_b^2}}{w_a*\sqrt{\sigma_a^2} + (1 - w_a)*\sqrt{\sigma_b^2}}$

$n  = \frac{w_a^2*\sigma_a^2 + 2*wa*(1 - w_a)*sqrt(\sigma_a^2*\sigma_b^2) + (1 - wa)^2*\sigma_b^2}{se^2}$

* [Script](scripts/smallest_n_for_se.R) has three functions for the 2-group case:
    - What is the optimal size of $n_a$ and $n_b$ when the variances, $w_a$, and $n$ are known?
    - What is the optimal size of $n$, $n_a$, and $n_b$ when se, $\sigma_a^2, \sigma_b^2, w_a$ are known (using constrained optimization)?
    -  What is the optimal size of $n$, $n_a$, and $n_b$ when se, $\sigma_a^2, \sigma_b^2, w_a$ are known (using the analytical formula)?

### What's the next best data point to collect when know the strata and strata variances?

Let’s say that once again we want to measure support for Mr. Obama. Let's assume that we have information about different strata in the population and know the variability of the response in each stratum. Let's say that our objective is to estimate the population mean with the smallest confidence interval. If I could collect only one additional data point, which strata would I sample from? The greater reduction in error will come from collecting data from the stratum where the responses are the most unpredictable, pro-rated by how big the stratum is.

* [Script](scripts/next_best_data_point.R)

### Authors

Ken Cor and Gaurav Sood
