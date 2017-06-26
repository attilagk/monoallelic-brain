---
layout: default
tags: [ chaggai, discussion, modeling ]
title: Overview of Approaches to Studying Replication Timing
---

TODO

## Introduction

Motivated by Chaggai's progress reports on 7 and 14 of June 2016, and our personal communication, I comment here on the methodology adopted from the two previous studies Chaggai has followed upon, namely those by [Koren et al] and [Mukhopadhyay et al].  I conclude with a very schematic outline for suggested analyses.

### Goal: characterize asynchronous replication domains (ARDs)

To my understanding the goals of the present project is to learn about...

* phenomenology of ARDs: length, genome-wise number, and relative location
* mechanisms: (epi)genetic determinants, regulators

### Study design, data

The data are DNA sequence *reads* collected from pairs of sets of sorted cells from the bone marrow of hybrid F1 mice.  The first set of a pair is thought to represent the *G1 phase* whereas the second set the *S phase*.  DNA libraries from the same bone marrow of some mouse may be considered technical replicates, whereas different mice as biological replicates.

## Two previous approaches

### Replication timing profiles

#### Measure of replication timing

The current and previous studies compared the G1-normalized count of S-phase reads that are uniquely mapped to either of two alleles.  These alleles are denoted here as $$m$$ and $$p$$ for maternal and paternal since the present project uses crossed mouse strains but in the study of [Koren et al]---which investigated SNPs---$$m,p$$ mean reference and alternative allele.  The allele-specific normalized read counts are defined as follows.  Let $$(g^m_k, h^m_k), \; k=1,...$$ be the start and end nucleotide position of the $$k$$th member in the sequence of G1-phase reads that are uniquely mapped to allele $$m$$.  Two distinct definitions for S-phase counts are

$$
\begin{eqnarray}
S^m_{ij} &=& \# \{ \text{S-phase reads at site } j \text{ uniquely mapped to allele } m \text{ for DNA library } i \} \\
\text{site } j &=&
\begin{cases}
\text{ bin } I^m_j = [g^m_{100(j-1)}, h^m_{100j} ] & \text{Koren et al, Chaggai} \\
\text{ SNP position } x_j \text{ differentiating } m, p & \text{alternative definition}
\end{cases}
\end{eqnarray}
$$

$$S^p_{ij}$$ is defined analogously. The alternative definition affords about $$\times 100$$ higher resolution (one point at each SNP instead of at each 100th SNP) but comes with the cost of $$\sqrt{100} = 10 \times$$ higher variance because binning is essentially averaging so that the central limit theorem applies.

To complete the view, $$G^m_{ij}$$ and $$G^p_{ij}$$ may be defined similarly to $$S^m_{ij}$$ and $$S^p_{ij}$$; note that the [Koren et al] definition gives trivially $$G^m_{ij}=100$$ for bin $$I^m_{ij}$$ and $$G^p_{ij}=100$$ for bin $$I^p_{ij}$$.  So, given either the [Koren et al] or the alternative definition of $$S^m_{ij},S^p_{ij},G^m_{ij},G^p_{ij}$$ two closely related measures of replication timing are

$$
\begin{eqnarray}
Y^m_{ij} &=& \frac{S^m_{ij}}{G^m_{ij}} \\
Z^m_{ij} &=& \frac{Y^m_{ij} - \bar{Y}^m_{i}}{s^m_{i}},
\end{eqnarray}
$$

where $$\bar{Y}^m_{i}$$ is the sample average of $$Y^m_{ij}$$ across all sites $$j$$ and $$s^m_i$$ is the corresponding sample standard deviation.  For the paternal allele, $$Y^p_{ij}$$ and $$Z^p_{ij}$$ were defined similarly. Thus, $$Y^m_{ij}$$ (and its standardized form $$Z^m_{ij}$$) quantify replication timing at position $$x_j$$: they are expected to be large if $$x_j$$ falls in an early replicating locus.

#### Smoothed profiles

Suppress the $$m$$ superscript and $$i$$ subscript on $$Y^m_{ij}$$ for simplicity. The points of the sequence $$\{Y_j\}, \; j=1,2,...$$ corresponds to (formally: isomorphic with) $$\{Y(x_j)\}$$. Formally, $$Y$$ is a function defined on the sequence position domain $$\{x_j : j=1,2,...\}$$ of sites.  Biologically, function $$Y$$ is interpreted as *replication timing profile*.  $$\{Z_j\}$$ can be treated similarly to $$\{Y_j\}$$ so I do not explicitly discuss here the former.

To aid visual exploration of replication timing profiles both studies smoothed $$Y$$ to reduce the high frequency variation (the "noise") on the sequence position domain.  [Mukhopadhyay et al] used a Gaussian filter and [Koren et al] cubic splines.  Compared to the Gaussian filter, the spline smoother has the following benefits:

* the bandwidth is automatically and optimally adjusted to the density of points
    * as implemented in the `smooth.spline` function of `R`'s `stats` package, optimality can be based on some cross-validation criterion, therefore only on the data, requiring no manual tuning
* the slope and curvature suggested by the unfiltered $$Y$$ is directly estimated

### Detection of ARDs

#### The main point

The crucial point is that neither studies could escape the **need to make some assumptions** on the phenomenological properties of ARDs (see Introduction) in order to detect those.  That would have been made possible only by some "gold standard" training data.  What information might be considered as appropriate training data has important implications to the suggested analysis (see below).

#### Details

[Mukhopadhyay et al] used explicit assumptions in their [simulator] program, such as the expected number of ARDs in the genome.  They used the simulated data to train their GenPlay Island finder (based on the [SICER] algorithm).  This is an (awkward) workaround to the standard approach of directly expressing those assumptions in a statistical model and then employ that in ARD detection from the observed test data.  Notably, [Mukhopadhyay et al] performed ARD calling *after smoothing*.

[Koren et al] defined sequence windows $$\{W_k\}$$ of arbitrary width and for each window $$W_k$$ performed a t-test using $$\{Z^m_{ij} - Z^p_{ij} \, : \, x_j \in W_k\}$$ as data for t-test.  Then they performed a meta analysis (calling it "consolidation") on the resulting p-values that merged neighboring significant windows.  Their assumptions on ARD phenomenology are implicit, buried in the window width, the significance threshold, and method of correction for multiple comparisons.

Further limitations of the method of [Koren et al] include:

* the clear autocorrelation of $$\{Z_{ij}\}$$ may bias the results of t-tests
* the significance of neighboring windows is established independently

The latter point may potentially lead to substantial loss of the sensitivity that might be gained from exploiting information on several marginally significant neighboring or nearby windows.  [Mukhopadhyay et al]'s GenPlay Island finder does not seem to suffer in this shortcoming.  Moreover, [Koren et al] did not assess the sensitivity of their ARD detection to the underlying assumptions whereas [Mukhopadhyay et al] assessed theirs.

## Suggested analyses

This is only an outline.  More in personal communication.

1. prior info available on ARDs for model building/training?
1. explore genome-wide replication timing profiles
    * prepare visual summaries that may guide the next step
2. make assumptions/hypotheses on ARD phenomenology
2. statistical model: create a new model or adopt previous ones developed for different problems
3. ARD calling with that model
    * implementation of new software tools or adoption existing ones
4. explore associations to (epi)genetic features

[Koren et al]: http://www.sciencedirect.com/science/article/pii/S0092867414013130
[Mukhopadhyay et al]: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4006724/?report=reader#!po=13.6364
[simulator]: https://github.com/JulienLajugie/ReplicationTimingSimulation
[SICER]: http://bioinformatics.oxfordjournals.org/content/25/15/1952.long
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
