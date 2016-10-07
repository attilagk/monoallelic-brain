---
layout: post
tags: [ andy, ]
---

The present analysis investigates more thoroughly the significance of effect on read count ratio of various predictors for various genes.  This is done by random permutations of the observed values of any given predictor and fitting the same models to both observed (unpermuted) and permuted data.  This approach is thought to provide more accurate p-values and confidence intervals (CIs) than deriving those from only the observed data using the standard way based on normal distribution theory (see ch8.3, p371 in A.C Davison: Statistical Models), which is very sensitive to the quality of model fit.  Indeed, a general finding from this analysis is that some genes show more unexpected distribution of CI than others and that variability is explained by diagnostics of model fit for the corresponding genes.  See [model checking]({{ site.baseurl }}{% post_url 2016-09-23-model-checking %}) for details.

{% include projects/monoallelic-brain/2016-09-20-permuted-observations.html %}
