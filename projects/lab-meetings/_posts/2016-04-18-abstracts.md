---
layout: default
tags: [ abstract ]
---

TODO

See NCBI collection [2016-04-18-abstracts][ncbi]

### Mutational History of a Human Cell Lineage from Somatic to Induced Pluripotent Stem Cells

#### Main points

1. several iPSC lines from polyclonal cells (fibroblasts) or from monoclonal cells (endothelial progenitor cells, EPCs) were derived and SNV mutations were called
1. distinct iPSC lines shared many SNVs only from the monoclonal origin
1. reprogramming of EPCs to iPSCs decreased the mutation rate from 14 to 0.8-1.7 SNVs/genome/cell division (see Estimation of mutation rates)
1. the latter result was obtained from calling sub-clonal SNVs using PCR amplicon resequencing
1. culturing and reprogramming shifted the mutational spectrum from the C>T transition (deamination of methylated C) to the C>A transversion (oxidative stress)

#### Estimation of mutation rates

Assume 24 cell divisions during EPC expansion and 1500 molecules amplified by each PCR (based on 5 ng PCR template).  Let $$\lambda_n$$ represent in the PCR template the mean molecule number of a given SNV that appeared in generation $$n$$, so that $$\lambda_n = 1500 / 2^{n+1}$$.  Let $$X$$ be the number of DNA molecules of that SNV in the PCR template.  If the SNV appeared at generation $$n$$ then assume $$X$$ is Poisson with rate parameter $$\lambda_n$$, so

$$
\begin{equation}
P_n(X=k) = \frac{\lambda_n^k e^{-\lambda_n}}{k !}
\end{equation}
$$

Note two points: (1) PCR detects the SNV in for all $$k>0$$ and (2) $$n$$ is unknown (we don't know in which generation the SNV arose but we still know that it *did* arise).  Therefore the probability of detecting the SNV (given that it arose in one of the 24 generations) is

$$
\begin{equation}
P = \frac{1}{24} \sum_{n=0}^{24} P_n(X>0)
\end{equation}
$$

Let $$Y$$ be the number of observed SNVs (detected by the PCR).  Then the maximum likelihood estimate of the mutation rate per 24 generations is $$Y/P$$, and that per 1 generation is $$Y/(24 P)$$.

### Joint Estimation of Contamination, Error and Demography for Nuclear DNA from Ancient Humans

1. ancient DNA samples are contaminated with present-day human DNA
1. previous demographic analyses of ancient humans modeled contamination separately, which incurs bias and discards useful information (with highly contaminated DNA)
1. the authors model contamination rate together with demographic parameters of interest such as drift times and admixture rates
1. parameters are estimated in a Bayesian framework using MCMC

### Analysis of 589,306 genomes identifies individuals resilient to severe Mendelian childhood diseases

1. the *resilience project* aims to find protective rather than causal mutations for Mendelian diseases
1. huge meta-analysis of genomic giga projects identified 13 individuals resilient to 8 Mendelian diseases but no protective variant could be identified
1. a core and expanded allele panel was constructed for prospective screening of resilient individuals
1. identification of protective variants will require different strategies depending on allele frequency and effect size (of the protective variant)

### Psychiatric Risk Gene Transcription Factor 4 Regulates Intrinsic Excitability of Prefrontal Neurons via Repression of SCN10a and KCNQ1

1. Transcription Factor 4 (TCF4) is a clinically pleiotropic gene associated with schizophrenia and Pitt-Hopkins syndrome (PTHS)
1. in utero knockdown of TCF4 and translating ribosome affinity purification suggested TCF4 represses a K-channel KCNQ1 and Na-channel SCN10a
1. current clamp recordings showed hypoexcitability in TCF4-suppressed neurons

### Environment‐induced epigenetic reprogramming in genomic regulatory elements in smoking mothers and their children

1. maternal smoking changes the methylome differently in the child than in the mother
1. these differential DNA methylation changes are maintained for years and are enriched in enhancers

### Transmission of human mtDNA heteroplasmy in the Genome of the Netherlands families: support for a variable-size bottleneck

1. heteroplasmy: more than one variant organellar genome within an individual
1. to avoid Muller's ratchet a mitochondrial bottleneck reduces transmission of heteroplasmies from the egg to the embryo
1. proposed mechanisms: increased genetic drift and possibly negative selection
1. the current study finds that only 9 mtDNA genomes are transmitted and negative selection prevents transmission of novel heteroplasmies

[ncbi]: http://www.ncbi.nlm.nih.gov/sites/myncbi/1D5mO3Pdwl4/collections/50062112/public/
