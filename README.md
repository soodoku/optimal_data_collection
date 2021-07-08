## Optimal Data Collection

What's the least amount of data you need to collect to estimate the population mean with a particular standard error? For the simplest case---estimating the mean of a binomial variable using simple random sampling, a conservative estimate of the variance ($p = .5$), and a $\pm3\%$ confidence interval---the answer ($n \sim 1,000$) is well known. The simplest case, however, assumes little to no information. Often, we know more. In opinion polling, we generally know sociodemographic strata in the population. And we have historical data on the variability in strata. Take, for instance, measuring support for Mr. Obama. A polling company like YouGov will usually have a long time series, including information about respondent characteristics. Using this data, the company could derive how variable the support for Mr. Obama is among different sociodemographic groups. With information about strata and strata variances, we can often poll fewer people (vis-a-vis random sampling) to estimate the population mean with a particular s.e. In this [note (pdf)](https://github.com/soodoku/optimal_data_collection/blob/main/ms/optimal_data_collection.pdf), we show how.

### Why?

In a realistic example, we find the benefit of using optimal allocation over simple random sampling is 6.5% (see the code block below). 

Assuming two groups $a$ and $b$, and using the notation in the note (see the pdf)---wa denotes the proportion of group $a$ in the population, vara and varb denote the variances of group a and b respectively, and letting p denote sample mean, we find that if you use the simple random sampling formula, you will estimate that you need to sample 1095 people. If you optimally exploit the information about strata and strata variances, you will need to just sample 1024 people.

```
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
```

### Manuscript and Scripts

* [Manuscript (pdf)](https://github.com/soodoku/optimal_data_collection/blob/main/ms/optimal_data_collection.pdf)

* What's the least amount of data we need to collect (and how) to estimate mean with a particular s.e. when we know the strata and strata variances?

    * [Script](scripts/smallest_n_for_se.R) has three functions for the 2-group case:
        * What is the optimal size of $n_a$ and $n_b$ when the variances, $w_a$, and $n$ are known?
        * What is the optimal size of $n$, $n_a$, and $n_b$ when $\sigma_{\bar{x}}, \sigma_a^2, \sigma_b^2, w_a$ are known (using constrained optimization)?
        * What is the optimal size of $n$, $n_a$, and $n_b$ when $\sigma_{\bar{x}}, \sigma_a^2, \sigma_b^2, w_a$ are known (using the analytical formula)?

* What's the next best data point to collect when you know the strata and strata variances?

    * [Script](scripts/next_best_data_point.R)

### Authors

Ken Cor and Gaurav Sood
