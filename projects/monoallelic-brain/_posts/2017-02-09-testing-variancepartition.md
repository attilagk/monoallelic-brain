---
title: Testing variancePartition
layout: default
tags: [ regression, anova, ]
featimg: "varpart-log-1.png"
---

This short article presents the testing of Gabriel Hoffman's variancePartition package on our read count ratio data.  In particular, a mixed effects model is fitted with Institution, Gender, Dx, and RNA_batch having random effects on the read count ratio and all other predictors having fixed effects.  No interactions are considered.  The large residual variance is probably due to the large variation among individuals.

Load packages...


```
## Error in library(variancePartition): there is no package called 'variancePartition'
```

```
## Loading required package: foreach
```

```
## Loading required package: iterators
```

```
## Loading required package: parallel
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
## Error in fitExtractVarPartModel(t(Q), form, E): could not find function "fitExtractVarPartModel"
```

```r
#vp.R <- fitExtractVarPartModel( t(R), form, E )
vp.S <- fitExtractVarPartModel( t(S), form, E )
```

```
## Error in fitExtractVarPartModel(t(S), form, E): could not find function "fitExtractVarPartModel"
```

## Results


```r
main <- "Q: quasi-log transformation"
plotVarPart(vp.Q, main = main)
```

```
## Error in plotVarPart(vp.Q, main = main): could not find function "plotVarPart"
```

```r
plotPercentBars(vp.Q)
```

```
## Error in plotPercentBars(vp.Q): could not find function "plotPercentBars"
```




```r
main <- "S: untransformed"
plotVarPart(vp.S, main = main)
```

```
## Error in plotVarPart(vp.S, main = main): could not find function "plotVarPart"
```

```r
plotPercentBars(vp.S)
```

```
## Error in plotPercentBars(vp.S): could not find function "plotPercentBars"
```
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
