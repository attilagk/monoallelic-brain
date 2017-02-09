---
layout: post
---

This analysis presents plots of the conditional distribution of the read count ratio statistic $$S$$ or its quasi-log transformed version $$Q$$ given each a gene a predictor of interest, which is either *Gender* or *Dx*.  For the predictor *Age* see the previous post [trellis display of data]({{ site.baseurl }}{% post_url /monoallelic-brain/2016-06-26-trellis-display-of-data %}).  In the present post a more detailed conditioning is done, using *RIN* and *Institution* for *MEG3* and *MEST*.  These are genes found in a previous analysis (see [permutation test]({{ site.baseurl }}{% post_url /monoallelic-brain/2016-10-03-permutation-test %})) to be significantly associated to *Gender* and *Dx*, respectively.  The plots below show that the distributions greatly overlap between differing levels of gender or disease even for the most significantly associated genes, and that this holds in case of further conditioning on RIN and Institution.

A distinct but related question is also addressed here, namely the correlation between $$S$$ (or $$Q$$) given one gene and that given another gene when the genes are near each other (in the same imprinted gene cluster) or far away (e.g. on a different chromosome).  However, no clear pattern emerges from this part of the analysis.

{% include projects/monoallelic-brain/2016-11-01-plotting-distribution-of-s.html %}
