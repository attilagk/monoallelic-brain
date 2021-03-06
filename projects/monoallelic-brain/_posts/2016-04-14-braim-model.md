---
layout: default
title: Bayesian regression allelic imbalance model (BRAIM)
tags: [modeling, regression, article]
---

The Bayesian regression allelic imbalance model (BRAIM) was published by Dulac and coworkers (Perez et al, [eLife 2015;4:e07860][Perez et al]) and was applied to RNA-seq data from the cerebellum of crossed F1 hybrid mice in same study to investigate:

* which genes are monoallelically expressed (imprinted), and to what degree
* the effect of cross, sex and age

Perez et al presents many interesting findings but here I focus only on BRAIM and compare it to the models I present in [this earlier post][binom models], which I will collectively refer to as AGK models using the initials of my name.  For my analysis read on [2016-04-14-braim-model.pdf][pdf].

[binom models]: {{ site.baseurl }}{% post_url /projects/monoallelic-brain/2016-02-19-binomial-models %}
[Perez et al]: http://elifesciences.org/content/4/e07860v2
[pdf]: {{ site.baseurl }}/assets/projects/monoallelic-brain/2016-04-14-braim-model.pdf
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
