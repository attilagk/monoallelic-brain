---
layout: post
tags: [ permutation, p-value, hypothesis-test ]
---

This analysis extends [permuted observations]({{ site.baseurl }}{% post_url /monoallelic-brain/2016-09-20-permuted-observations %}) to testing hypotheses $$\beta_j=0, \; j=1,...,p$$ for any gene.  This is done by random permutation tests, which provide only approximate p-values in contrast with exact permutation tests (which are unpractical in the present case due to the large number $$n!$$ of all permutations of $$n\approx 500$$ cases).  These approximations more or less agree with the "theoretical" p-values, which are based on the hypothesis that the Studentized $$\hat{\beta}_j$$ follows a t-distribution on $$n - p$$ degrees of freedom (see ch8.3, p371 in A.C Davison: Statistical Models):

$$
\begin{equation}
\frac{\hat{\beta}_j - \beta_j}{\sqrt{S^2 \left[ (X^\top X)^{-1} \right]_{jj}}} \sim t_{n - p},
\end{equation}
$$

where $$S^2$$ is the unbiased estimate of the error variance (based on the residual sum of squares), and $$X$$ is the design matrix.

The t-distribution comes from the second order assumptions on the error $$\epsilon_i$$ and on their normality; from these the normality of the residuals $$e_i$$ follows.  Thus normality of $$e_i$$ is a prerequisite for deriving p-values using the above theoretical approach.  In agreement with this comparison to the [model checking]({{ site.baseurl }}{% post_url /monoallelic-brain/2016-09-23-model-checking %}) results, in particular the normal Q-Q plots of residuals, reveals that the two approaches to p-value calculation agree as long as the model fits the data well.  Otherwise the t-distribution based approach tends to produce much lower p-values and therefore exaggerate the significance that $$\beta_j\neq 0$$, as seen for several "poorly-fit" genes under the logistic model logi.S.

Click [regr-coefs.csv][regr-coefs.csv] (long format) and [regr-coefs-w.csv][regr-coefs-w.csv] (wide format, annotated with stars) to download the saved csv files reporting both p-values and the estimate for all regression coefficients.  Click
[signif-gene-effects-wnlm.Q.csv][signif-gene-effects-wnlm.Q.csv], [signif-gene-effects-logi.S.csv][signif-gene-effects-logi.S.csv], [signif-gene-effects-either.csv][signif-gene-effects-either.csv], or [signif-gene-effects-both.csv][signif-gene-effects-both.csv] for a gene-centric list of significant coefficient--gene associations mediating various biological effects, where each list corresponds to a rule of aggregation of p-values across the wnlm.Q and logi.S model types.  For the corresponding coefficient centric lists see
[signif-effect-genes-wnlm.Q.csv][signif-effect-genes-wnlm.Q.csv], [signif-effect-genes-logi.S.csv][signif-effect-genes-logi.S.csv], [signif-effect-genes-either.csv][signif-effect-genes-either.csv], or [signif-effect-genes-both.csv][signif-effect-genes-both.csv].

{% include projects/monoallelic-brain/2016-10-03-permutation-test.html %}

[regr-coefs.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/regr-coefs.csv
[regr-coefs-w.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/regr-coefs-w.csv
[signif-gene-effects-wnlm.Q.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-gene-effects-wnlm.Q.csv
[signif-gene-effects-logi.S.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-gene-effects-logi.S.csv
[signif-gene-effects-either.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-gene-effects-either.csv
[signif-gene-effects-both.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-gene-effects-both.csv
[signif-effect-genes-wnlm.Q.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-effect-genes-wnlm.Q.csv
[signif-effect-genes-logi.S.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-effect-genes-logi.S.csv
[signif-effect-genes-either.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-effect-genes-either.csv
[signif-effect-genes-both.csv]: {{ site.baseurl }}/assets/projects/monoallelic-brain/signif-effect-genes-both.csv
