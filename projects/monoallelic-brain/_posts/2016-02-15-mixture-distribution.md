---
layout: default
title: Error Rates and Mixture Distributions
tags: [ classification, error-rate, sampling ]
---

Hello World!

---
layout: post
title: Temporary Title
---


```r
source('errors.R')
```

```
## Warning in file(filename, "r", encoding = encoding): cannot open file
## 'errors.R': No such file or directory
```

```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

## Appendix for **Statistical Overview**

Define probability densities

```r
pi1 <- 1/3; pi0 <- 1 - pi1
dpval1 <- dpval.maker(pi1=pi1, lambda=20)
```

```
## Error in dpval.maker(pi1 = pi1, lambda = 20): could not find function "dpval.maker"
```

```r
dpval2 <- dpval.maker(pi1=pi1, lambda=100)
```

```
## Error in dpval.maker(pi1 = pi1, lambda = 100): could not find function "dpval.maker"
```

```r
h1 <- hist(pval.sampler(dpval1, 3170), breaks=20, plot=FALSE)
```

```
## Error in pval.sampler(dpval1, 3170): could not find function "pval.sampler"
```

```r
par(mfrow=c(1,2))
par(mar = c(par('mar')[1], 2, par('mar')[3:4]))
# upper plot to recreate Fig. 1 of Storey & Tibshirani 2003
plot.new()
plot.window(xlim=0:1, ylim=c(0, h1.max <- ceiling(max(h1$density))))
```

```
## Error in plot.window(xlim = 0:1, ylim = c(0, h1.max <- ceiling(max(h1$density)))): object 'h1' not found
```

```r
axis(1)
axis(2, c(0:h1.max, pi0), c(0:h1.max, expression(pi[0])), las=1)
```

```
## Error in axis(2, c(0:h1.max, pi0), c(0:h1.max, expression(pi[0])), las = 1): object 'h1.max' not found
```

```r
title(main='', xlab='p-value')
plot(h1, freq=FALSE, add=TRUE)
```

```
## Error in plot(h1, freq = FALSE, add = TRUE): object 'h1' not found
```

```r
lines(x <- 0:100/100, dpval2(x), col='gray', lwd=2)
```

```
## Error in dpval2(x): could not find function "dpval2"
```

```r
lines(x, dpval1(x), col='black', lwd=2)
```

```
## Error in dpval1(x): could not find function "dpval1"
```

```r
abline(h=1, lty='dashed')
abline(h=pi0, lty='dotted')
legend('top', legend = c(expression(lambda==20), expression(lambda==100)), col=c('black', 'gray'), lwd=2)
# lower plot to illustrate the probability of (mis)classification events
par(mar = c(par('mar')[1], 0, par('mar')[3:4]))
plot.new()
plot.window(xlim=c(0,0.3), ylim=c(0, h1.max <- ceiling(dpval1(0))))
```

```
## Error in dpval1(0): could not find function "dpval1"
```

```r
axis(1, c(0, thrs <- 5e-2, 0.2, 0.3), c(0, expression(threshold), 0.2, 0.3))
axis(2, c(0:h1.max, pi0), c(0:h1.max, expression(pi[0])), las=1)
```

```
## Error in axis(2, c(0:h1.max, pi0), c(0:h1.max, expression(pi[0])), las = 1): object 'h1.max' not found
```

```r
title(main='', xlab='p-value')
abline(h=1, lty='dashed')
x <- 0:100/100*0.3; y <- dpval1(x)
```

```
## Error in dpval1(x): could not find function "dpval1"
```

```r
polygon(x=c(x, 0.3, 0, 0), y=c(y, 0, 0, dpval1(0)), col='gray', border=NA)
```

```
## Error in xy.coords(x, y, setLab = FALSE): object 'y' not found
```

```r
lines(x, y, col='black', lwd=2)
```

```
## Error in xy.coords(x, y): object 'y' not found
```

```r
abline(h=pi0, lty='dotted')
abline(v=thrs, lty='dotted')
text(rep(c(thrs/2, thrs*3/2), each=2), rep(c(pi0/2, pi0*3/2), times=2), c('FP', 'TP', 'TN', 'FN'))
```

![plot of chunk exp-unif-mixture]({{ site.baseurl }}/projects/monoallelic-brain/R/2016-02-15-mixture-distribution/figures/exp-unif-mixture-1.png)

Let us take the number of all genes = 2.5 &times; 10<sup>4</sup>.  With 200 number of imprinted genes suggested by DeVeale et al $$\pi_1 =$$ 
0.008.
With 1300 number of imprinted genes suggested by Gregg et al $$\pi_1 =$$ 0.052.

Calculate FDR for various cases

```r
get.error.rates(pi1=deveale$pi1, lambda=20, 1e-2)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 20, 0.01): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=20, 1e-2)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 20, 0.01): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=deveale$pi1, lambda=20, 1e-4)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 20, 1e-04): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=20, 1e-4)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 20, 1e-04): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=deveale$pi1, lambda=20, 1e-8)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 20, 1e-08): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=20, 1e-8)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 20, 1e-08): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=deveale$pi1, lambda=2000, 1e-2)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 2000, 0.01): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=2000, 1e-2)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 2000, 0.01): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=deveale$pi1, lambda=2000, 1e-4)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 2000, 1e-04): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=2000, 1e-4)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 2000, 1e-04): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=deveale$pi1, lambda=2000, 1e-8)$fdr
```

```
## Error in get.error.rates(pi1 = deveale$pi1, lambda = 2000, 1e-08): could not find function "get.error.rates"
```

```r
get.error.rates(pi1=gregg$pi1, lambda=2000, 1e-8)$fdr
```

```
## Error in get.error.rates(pi1 = gregg$pi1, lambda = 2000, 1e-08): could not find function "get.error.rates"
```
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
