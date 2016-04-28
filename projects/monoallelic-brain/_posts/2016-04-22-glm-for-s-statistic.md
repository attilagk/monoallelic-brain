---
layout: post
title: Logistic Models Using the S statistic as Response (Work in Progress)
tags: [ regression, reproducible-research ]
---

## Introduction

[Previous analysis][ifat] by Ifat analyzed the relationship between age and allelic imbalance by fitting a normal linear model to rank-transformed $$s_{ig}$$ values averaged over a set of $$8$$ genes.  My [follow-up analysis][nlm g13] extended this to a set of $$13$$ genes.  Here alternative models are fitted directly to the (untransformed) $$s_{ig}$$ values.  Furthermore, all models are fitted to not only aggregated gene sets but also single genes.  Models are compared based on the Akaike information criterion (AIC).

{% include projects/monoallelic-brain/2016-04-22-glm-for-s-statistic.html %}

[nlm g13]: {{ site.baseurl }}{% post_url 2016-03-02-ifats-regression-analysis %}
[ifat]: https://docs.google.com/presentation/d/1YvpA1AJ-zzir1Iw0F25tO9x8gkSAzqaO4fjB7K3zBhE/
