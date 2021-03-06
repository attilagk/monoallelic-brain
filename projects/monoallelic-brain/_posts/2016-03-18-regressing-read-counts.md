---
layout: default
tags: [ regression, monoallelic-expression ]
featimg: "read-count-regr-1.png"
---

This document supplements the **article** [Binomial Models]({% post_url /projects/monoallelic-brain/2016-02-19-binomial-models %}).

Following the article, define link function for generalized linear model based on the logistic function as 
$$
\begin{equation}
p_v = \max \left( \mathrm{logit}^{-1}(x_i\, \beta), \, \frac{1}{2} \right)
\end{equation}
$$
where $$p_v$$ is the expected fraction of read count of the alternative allele.
Compared to the article, $$b_v$$ has been replaced by $$\beta$$ but this has no impact on the main point of this post.  Here we consider a single explanatory variable $$x$$ age, so $$\beta=(\beta_0,\beta_1)$$, where $$\beta_0$$ is the "intercept" term and $$\beta_1$$ mediates the effect of $$x$$ on $$p_v$$.

We implement the link function as `logistic.upper` as follows:

```r
logistic.upper <- function(x, b0, b1) {
    l <- 1 / (1 + exp(-(b0 + x * b1)))
    l[l < 1/2] <- 1/2
    return(l)
}
```

Fix $$p_1=0.9$$ and, as discussed in the article, set $$\beta_0 = \mathrm{logit}(p_1)$$.  Let $$\beta_1=0.02$$ corresponding to a $$50$$ year exponential time constant.  Then $$p_v$$ starts with value $$0.9$$ at birth and decays to $$1/2$$ a bit later than a century.
![plot of chunk read-count-regr]({{ site.baseurl }}/projects/monoallelic-brain/R/2016-03-18-regressing-read-counts/figure/read-count-regr-1.png)
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
