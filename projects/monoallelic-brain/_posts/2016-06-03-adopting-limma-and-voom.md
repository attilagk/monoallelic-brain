---
layout: default
title: Adopting limma and voom
tags: [regression, discussion, article, expression]
---

The R packages limma and voom have been developed for analysis of RNA-seq read count data, whereby RNA-seq artifacts are modeled successfully, as it was demonstrated.  Here I consider employing limma and voom for our study.

## Background

Ifat's initial analysis (stage 1) used $$R_i$$, the rank transformed $$S_{ig}$$ statistic averaged over 8 known imprinted genes $$g\in\{g_1,...,g_8\}$$ as the response variable of a normal linear model.  My [subsequent analysis][logi] extended this framework in several ways, fitting 88 various multiple regression models (and 88 additional simple regression models).  These extensions include

* both separate and aggregated
* a few more known imprinted genes

My analysis (referred to here as stage 2) confirmed Ifat's result (stage 1) suggesting loss of the 8 genes' imprinting with age when they are averaged and added some new results:

* separate analysis of 16 known imprinted genes showed for some genes significant loss of imprinting while for others no change with age or even significant gain
* statistical power was too small for 3 of 16 genes (scarce data)
* age and institution had the largest effect, yet the age effect was quite mild
* the logistic model `logi.S` appeared the best of those tested based on model fit and interpretability with regards to data sets from 16 known imprinted genes
* the normal linear model `nlm.S` has simpler interpretation but was found to be inadequate for untransformed $$S$$ (due to the heteroscedasticity)

Some of the remaining questions:

* how well does/would the logistic model fit data from
    * the 16 genes of stage 2?
    * those classified by Ifat as novel imprinted genes?
    * genes with possibly small parental bias?
* are there data transformations that support the normal linear model for all genes?
* how to increase power by borrowing strength across genes but still allow gene-gene variability?

The `limma` package with its recent `voom` extension appears a powerful tool to answer the above questions.

## limma and voom

The figure, taken from the [2015 limma paper][limma], showcases the features of `limma`:
![limma F1]

Its `voom` extension takes care of two challenging features of RNA-seq data: strong heteroscedasticity and overdispersion (relative to the Poisson/binomial distributions).  `voom` "unlocks" the versatile and powerful toolbox of `limma` by estimating the precision -- the inverse error variance -- for each observation (i.e. for each pair of tissue sample $$i$$ and gene $$g$$) and using that precision as weight in the normal linear model.  [Here][voom F2] is the illustration of how precision for two observations is obtained by `voom`.

## Adoption to the present study

To make the data accessible to `limma` and `voom`, allele-specific read counts should be used instead of the $$S$$ statistic derived from those.  This means that for each individual $$i$$ and gene $$g$$ we would have at least one pair of read counts: one for parental allele $$A$$ and another for allele $$B$$.  `limma` could then be used to detect differential expression between the two alleles.

Let $$\{s:s\in(i,g)\}$$ be all $$k$$ heterozygous SNP variant sites that occur in individual $$i$$ and gene $$g$$ and let $$I_s$$ indicate the event that the reference variant is maternal.  Because that event is random (unless we have prior knowledge that $$g$$ is imprinted maternally or paternally), there are $$2^k$$ allele configurations for $$(i,g)$$.  A rule -- used in the definition of $$S$$ -- that could reduce the number of configurations to 1 would be summing the higher read counts (and the lower read counts) over all $$s$$.

This table compares `limma` (potential stage 3 analysis) with two modeling approaches `nlm.R` and `logi.S` from stage 1 and 2, respectively.

|--|-------|--------|--------------|
|  | nlm.R | logi.S | limma + voom | 
|--|-------|--------|--------------|
| response | R: rank transformed S | S | $$\log \mathrm{cpm}_A, \log \mathrm{cpm}_B$$ | 
|--|-------|--------|--------------|
| precision weights / overdispersion | no / no | yes / no | yes / yes | 
|--|-------|--------|--------------|
| gene-gene variability | w/o borrowing of strength | w/o borrowing of strength | yes | 
|--|-------|--------|--------------|
| borrowing of strength (genes) | w/o variability | w/o variability | yes | 
|--|-------|--------|--------------|
| age dependence H_0 | $$\beta_\mathrm{age} = 0$$ | $$\beta_\mathrm{age} = 0$$ | $$\beta_{\mathrm{age},A} = \beta_{\mathrm{age},B}$$| 
|--|-------|--------|--------------|
| effect size / interpretation | no | yes / difficult | yes / simple | 
|--|-------|--------|--------------|
| overall parental bias H_0 | no | $$\beta_0 = 1/2$$ |  $$\beta_{0,A} = 1/2$$ and $$\beta_{0,B} = 1/2$$ | 
|--|-------|--------|--------------|
| genome-wise applicability | yes | ? | yes | 
|--|-------|--------|--------------|
| proportion of H_0 | no | ? | yes | 
|--|-------|--------|--------------|
| gene set testing | no | no | yes | 
|--|-------|--------|--------------|

[logi]: {{ site.baseurl }}{% post_url /projects/monoallelic-brain/2016-04-22-glm-for-s-statistic %}
[limma]: http://nar.oxfordjournals.org/content/early/2015/01/20/nar.gkv007.long
[limma F1]: http://nar.oxfordjournals.org/content/early/2015/01/20/nar.gkv007/F1.large.jpg
[voom]: http://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-2-r29
[voom F2]: http://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-2-r29#Fig2
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
