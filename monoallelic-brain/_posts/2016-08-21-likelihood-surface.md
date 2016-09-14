---
layout: post
tags: [ likelihood, regression, multivariate ]
---

## Motivation

In the present observational study the effects of predictors are random.  Associations among predictors has a negative impact on *maximum likelihood estimation (MLE)* of the vector of regression coefficients $$\beta = (\beta_1,...,\beta_p)$$.  This is because the association (in the probabilistic sense, i.e. dependence) among predictors induces an association among the coefficients $$\{\beta_i\}$$ themselves in the sense of a specific directionality in the gradients of the likelihood surface; that directionality is what makes MLE less reliable.  Confidence regions of all $$p$$ coefficients are quasi-*ellipsoids* on the $$p$$-dimensional parameter space on which the likelihood function is defined.

Plotting ellipses that are the two-dimensional sections of these ellipsoids---e.g. as a contourplot---, illustrates vividly the pairwise association between some $$\beta_a$$ and $$\beta_b$$.  This corresponds to a $$2$$-dimensional restriction of the $$p$$-dimensional parameter space that is achieved by fixing the remaining $$p-2$$ coefficients at their MLE or at some theoretically meaningful value. The stronger the association is the more diagonally elongated shape the ellipse takes.  The extreme case is collinearity of $$\beta_a$$ and $$\beta_b$$, in which case the two are *unidentifiable* and the ellipse becomes a pair of parallel contour lines so MLE fails since there is no unique maximum of the likelihood function.

For association among predictors see [2016-06-26-trellis-display-of-data]({{ site.baseurl }}{% post_url 2016-06-26-trellis-display-of-data %}).  Note that association does not in general violate the linearity assumption of (generalized) linear models but in the present study it appears to do so as shown in [2016-07-08-conditional-inference]({{ site.baseurl }}{% post_url 2016-07-08-conditional-inference %}).

{% include projects/monoallelic-brain/2016-08-21-likelihood-surface.html %}
