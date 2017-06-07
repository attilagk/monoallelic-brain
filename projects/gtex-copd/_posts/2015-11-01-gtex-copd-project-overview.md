---
layout: default
title: GTEx-COPD Project Overview
---

# Disease and Tissue Dependence of eQTLs

## Background

Gene expression is a cellular-level phenotype, which provides a mechanistic
link between genotype and the individual-level disease phenotype.  Therefore,
eQTL analysis of expression data potentially helps utilization of GWAS results (GTEx Cons 2015 Science Fig S14A).

## Goals

* study dependence of eQTLs on tissue types and disease phenotypes
* help utilize GTEx data in the interpretation of GWAS

## Participants

* Tao Huang,..., Zhidong Tu
* Oct 2015: Attila takes over project from Tao

## Data, approach

* gene expression, genotypes from GTEx and LGRC projects
  * RNAseq vs microarray
* clinical variables from LGRC
* conditions
  * 9 GTEx tissue conditions: blood, lung,...
  * 3 LGRC disease conditions (all lung): COPD, ILD, ctrl
* call cis-eQTLs (GTEx Cons 2015 Science Fig S14B)
* compare condition pairs (based on called eQTLs)
  * overall
  * given eQTL is associated to COPD (COPD-GWAS)

## Main results, conclusions

* overall: eQTLs depend more on tissue than disease condition
* COPD-GWAS eQTLs: strong dependence on COPD disease condition

## Publication status

MS was submitted to PLoS Genetics twice.  The editors did not accept it for publication based on the following criticism of two reviewers:

* data, analysis, conclusions are immature
    * low statistical power
    * reanalize with additional GTEx data
* more results and discussion on COPD needed
  * present (also better analyze?) clinical variables
* better clarification of GTEx disease status needed
* more analysis needed on the effects of population structure
* improved writing needed (grammar and discussion)


## Key paper: GTEx Cons 2015 Science

* the marginal posterior for tissue-pairs (Bayesian analyses) correlates well with $$\pi_1$$ (Fig S13)
* Bayesian methods detect eQTLs in single tissues with more power by borrowing strength from other tissues (Fig 2D)
* eQTLs tend to be either specific to a single tissue or ubiquitous (all 9 tissues; Fig 2C), which supports binary classification of eQTLs as tissue specific and ubiquitous
* allele specific expression (ACE): cis-eQTL genotype $$G$$ is a poor predictor of expression $$E$$ of its eGene; additional (genetic, epigenetic or environmental) factors $$F$$ must exist:
$$
\begin{equation}
P(E | G ) \neq P(E | G,F) \approx \hat{P}_\mathrm{obs}(E | G)
\end{equation}
$$
* eQTLs tend to be associated with diseases in a tissue-dependent manner (Fig 8A) and can enhance power of GWAS (Fig 8B)
* prioritization of putative causal genes: being an eGene for a disease-associated SNP is mechanistically stronger evidence than high LD with that SNP
* prioritization of (sets of) causal tissues (Fig 9)
# Detailed Methods

## Comparing eQTLs between tissues with $$\pi_1$$ analysis

This uses a score $$\pi_1(a|b)$$ to quantify the similarity between tissue sample conditions $$a$$ and
$$b$$  in terms of their eQTLs. It was introduced by Nica et al 2011 PLoS Genet in their matched
co-twin analysis (MCTA) of MuTHER data.  First I derive the related $$\pi_1(a)$$ score.

Given a condition $$a$$, we test each of $$m$$ SNP--gene pair (feature) for being an eQTL (more
precisely, a cis-eQTL--eGene pair).  We call such tests $$a$$-tests.  The following table shows the
counts of each possible outcome after carrying out all $$a$$-tests (Storey & Tibshirani 2003 PNAS):

              +---------------+---------------+--------------------+---------------+
              |               | Called eQTL   | Called non-eQTL    |  Total        |
              +===============+===============+====================+===============+
              | True eQTL     |      T        |      π1(a) * m - T |  π1(a) * m    |
              +---------------+---------------+--------------------+---------------+
              | True non-eQTL |      F        |      π0(a) * m - F |  π0(a) * m    |
              +===============+===============+====================+===============+
              | Total         |      S        |        m - S       |    m          |
              +---------------+---------------+--------------------+---------------+

where

* $$S$$ is the number of calls defined at significance level (false
  positive rate) $$t$$ as $$S = \# \{p_i \leq t \}, \; i=1,...,m$$
* $$T$$ and $$F$$ are the number of true and false positives, respectively
* $$\pi_1(a)$$ and $$\pi_0(a) = 1 - \pi_1(a)$$ are the fraction of true eQTLs and true non-eQTLs, respectively, in all tested features

$$\pi_1(a)$$ can be estimated by $$1 - \hat{\pi}_0(a)$$ using Storey's method
(qvalue package). That estimation is based on the (empirical) distribution of
the p-values from all $$a$$-tests $$\{p_i^a\}$$.  The distribution of the random
variable $$p^a$$ is the $$\pi_1^a : \pi_0^a$$ mixture of a non-uniform and
a uniform distribution representing true eQTLs and true non-eQTLs.  Uniformity
of the latter follows from a general property of the p-value $$V$$ (a random
variable). Namely, under the null hypothesis
$$
\begin{equation}
F_V(\alpha) = P(V \leq \alpha)
= \alpha =  F_U(\alpha),
\end{equation}
$$
which shows that
$$
\begin{equation}
V \overset{\mathrm{dist}}{=} U,
\end{equation}
$$
where $$\alpha \in [0, 1], \;  U \sim \mathcal{U}(0,1)$$.

Storey initially defined the $$\hat{\pi}_0(a)$$
estimator based on the last bin of the p-value histogram in the interval
$$[\lambda, 1]$$ as

$$
\begin{equation}
\hat{\pi}_0(a) = \lim_{\lambda \rightarrow 1} \frac{\# \{p_i \lt \lambda \} }{ m (1 - \lambda)}.
\end{equation}
$$

The estimator's bias is minimized as $$\lambda \rightarrow 1$$ but its variance increases, which motivated Storey to introduce a more practical estimator (implemented in qvalue) based on a fitted cubic spline $$\hat f$$ as $$\hat{\pi}_0(a) = \hat f(1)$$.

In contrast to $$\pi_1(a)$$, the $$\pi_1(a|b)$$ statistic is derived from not all $$m$$ features but only
those $$m^b$$ features that have been called eQTL for some other condition $$b$$, so $$m^b$$ should be
replaced by $$m$$ in the table above, and analogous replacements should be made for $$T, F$$ and $$S$$.
In particular, $$\pi_1(a)$$ should be replaced by $$\pi_1(a|b)$$, whose estimation is based on $$\{p_i^a \,
  | \, p_i^b \leq t \}$$, the set of p-values from all such $$a$$-tests whose corresponding $$b$$-test resulted in a positive call, i.e. an eQTL ('corresponding' means testing the same SNP--gene feature).

The rationale behind the above definition of
$$
\begin{equation}
\pi_1(a|b)
\end{equation}
$$
is that...

## GTEx Cons 2015 Science: Methodological differences compared to Tao's work
* narrower window ($$\pm 100$$ kb from TSS) to distinguish cis from trans-eQTLs
* multi-tissue eQTL calling (more powerful than single tissue); p-value permutations
* Storey-Tibshirani-type FDR control (more powerful than the Benjamini-Hochberg)
* (in addition to $$\pi_1$$ analysis) joint Bayesian modeling of multiple tissues (Flutre et al 2013 PLOS Genet., Li,..., Nobel 2015 arxiv)
* condition specificity: posterior instead of Q statistic (Schug et al 2005 Genome Biol)

## Data details

* \# of tissue samples match between Tao's ms and GTEx 2015 Science but version does not (v2 vs.~v3)

<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
