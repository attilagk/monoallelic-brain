---
title: Testing variancePartition
layout: default
tags: [ regression, anova, ]
featimg: "varpart-log-1.png"
---

This short article presents the testing of Gabriel Hoffman's variancePartition package on our read count ratio data.  In particular, a mixed effects model is fitted with Institution, Gender, Dx, and RNA_batch having random effects on the read count ratio and all other predictors having fixed effects.  No interactions are considered.  The large residual variance is probably due to the large variation among individuals.

Load packages...


```
## Loading required package: ggplot2
```

```
## Loading required package: foreach
```

```
## Loading required package: Biobase
```

```
## Loading required package: BiocGenerics
```

```
## Loading required package: methods
```

```
## Loading required package: parallel
```

```
## 
## Attaching package: 'BiocGenerics'
```

```
## The following objects are masked from 'package:parallel':
## 
##     clusterApply, clusterApplyLB, clusterCall, clusterEvalQ,
##     clusterExport, clusterMap, parApply, parCapply, parLapply,
##     parLapplyLB, parRapply, parSapply, parSapplyLB
```

```
## The following objects are masked from 'package:stats':
## 
##     IQR, mad, xtabs
```

```
## The following objects are masked from 'package:base':
## 
##     anyDuplicated, append, as.data.frame, cbind, colnames,
##     do.call, duplicated, eval, evalq, Filter, Find, get, grep,
##     grepl, intersect, is.unsorted, lapply, lengths, Map, mapply,
##     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
##     Position, rank, rbind, Reduce, rownames, sapply, setdiff,
##     sort, table, tapply, union, unique, unsplit, which, which.max,
##     which.min
```

```
## Welcome to Bioconductor
## 
##     Vignettes contain introductory material; view with
##     'browseVignettes()'. To cite Bioconductor, see
##     'citation("Biobase")', and for packages 'citation("pkgname")'.
```

```
## Loading required package: iterators
```

Import data, define model formula:


```r
# selected set of genes
gene.ids <- unlist(read.csv("../../data/genes.regression.new", as.is = TRUE))
names(gene.ids) <- gene.ids
# predictors
names(e.vars) <- e.vars
E <- get.predictors()[e.vars]
# response: Q, quasi-log transformed read count ratio
Y <- get.readcounts(gene.ids = gene.ids, count.thrs = 0)
Q <- data.frame(sapply(Y[gene.ids], getElement, "Q"))
# response: R, rank transformed read count ratio
R <- data.frame(sapply(Y[gene.ids], getElement, "R"))
# response: S, untransformed
S <- data.frame(sapply(Y[gene.ids], getElement, "S"))
# model formula
form <- ~ Age + (1|Institution) + (1|Gender) + PMI + (1|Dx) + RIN +(1|RNA_batch) + Ancestry.1 + Ancestry.2 + Ancestry.3 + Ancestry.4 + Ancestry.5
```

Fitting the linear mixed model to various transformations:


```r
vp.Q <- fitExtractVarPartModel( t(Q), form, E )
```

```
## Projected run time: ~ 0.4 min
```

```
## Warning: executing %dopar% sequentially: no parallel backend registered
```

```
## Loading required package: Matrix
```

```
## Warning: Some predictor variables are on very different scales: consider
## rescaling
```

```
## Warning: Some predictor variables are on very different scales: consider
## rescaling
```

```r
#vp.R <- fitExtractVarPartModel( t(R), form, E )
vp.S <- fitExtractVarPartModel( t(S), form, E )
```

```
## Projected run time: ~ 0.02 min
```

```
## Warning: Some predictor variables are on very different scales: consider
## rescaling

## Warning: Some predictor variables are on very different scales: consider
## rescaling
```

## Results


```r
main <- "Q: quasi-log transformation"
plotVarPart(vp.Q, main = main)
```

<img src="{{ site.baseurl }}/projects/monoallelic-brain/R/2017-02-09-testing-variancepartition/figure/varpart-log-1.png" title="plot of chunk varpart-log" alt="plot of chunk varpart-log" width="700px" />

```r
plotPercentBars(vp.Q)
```

<img src="{{ site.baseurl }}/projects/monoallelic-brain/R/2017-02-09-testing-variancepartition/figure/varpart-log-2.png" title="plot of chunk varpart-log" alt="plot of chunk varpart-log" width="700px" />




```r
main <- "S: untransformed"
plotVarPart(vp.S, main = main)
```

<img src="{{ site.baseurl }}/projects/monoallelic-brain/R/2017-02-09-testing-variancepartition/figure/varpart-untransformed-1.png" title="plot of chunk varpart-untransformed" alt="plot of chunk varpart-untransformed" width="700px" />

```r
plotPercentBars(vp.S)
```

<img src="{{ site.baseurl }}/projects/monoallelic-brain/R/2017-02-09-testing-variancepartition/figure/varpart-untransformed-2.png" title="plot of chunk varpart-untransformed" alt="plot of chunk varpart-untransformed" width="700px" />
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
