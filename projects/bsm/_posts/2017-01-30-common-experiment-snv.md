---
title: Somatic SNVs and Indels by HaplotypeCaller
layout: default
featimg: "barchart-1.png"
---

From Alison Barton in Peter Park's lab we received a set of annotated SNV and indel variants called by the GATK [HaplotypeCaller] based on three samples from the same individual:

1. Fibro_Common_7 (fibroblasts)
1. Common_7_NeuN (sorted NeuN+ neurons from the dorsolateral prefrontal cortex DLFPC)
1. LBRCE-pfc-1b123 (tissue from the PFC)

This analysis summarizes the more than 4 million variants in the vcf file `Common_experiment_HC.vqsr.snp.indel.vcf.gz` provided by Alison on 2017-01-24.  In particular, those variants are in focus that are specific to either of the three samples since these represent some type of somatic mozaicism.  See the *Discussion* below on how somatic mozaicism may be interpreted given the present statistical approach (HaplotypeCaller).

Open [snv-2017-01-24.1-1000.tsv] to look at the first thousand variants and their annotations in an Excel-like program.  Similarly, open [snv-2017-01-24.Fibro_Common_7.recode.tsv] for somatic variants specific to the fibroblast sample (equivalently, brain specific variants).


[snv-2017-01-24.1-1000.tsv]: {{ site.baseurl}}/assets/projects/bsm/snv-2017-01-24.1-1000.tsv
[snv-2017-01-24.Fibro_Common_7.recode.tsv]: {{ site.baseurl}}/assets/projects/bsm/snv-2017-01-24.Fibro_Common_7.recode.tsv
[HaplotypeCaller]: https://software.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php


## Definitions

**(all) kept variants**
* these were kept by the quality filter (see `PASS` in the `FILTER` field of the vcf file)
* they include specific and non-specific variants

**sample-specific variants**
* these are specific to either of the three samples
* thus they represent a certain type of somatic mozaicism (see *Discussion* below)

## Analysis

Extract the number of kept variants:


```bash
# after running "runme.sh"
cd ../../results/common-experiment/snv/2017-01-24-alison
BN="snv-2017-01-24"
grep '^After filtering.*Sites' $${BN}.log | sed 's/.*kept \([[:digit:]]\+\) out of.*/\1/' > kept.vars
cat $${BN}.log
```

```
## grep: 6883{BN}.log: No such file or directory
## cat: 6883{BN}.log: No such file or directory
```

Read number of kept variants and also read the sites of singletons:


```r
kept.vars <- scan(file = "../../results/common-experiment/snv/2017-01-24-alison/kept.vars")
singletons <- read.delim("../../results/common-experiment/snv/2017-01-24-alison/snv-2017-01-24.singletons")
head(singletons)
```

```
##   CHROM   POS SINGLETON.DOUBLETON ALLELE            INDV
## 1     1 28863                   S      A LBRCE-pfc-1b123
## 2     1 69063                   S      C LBRCE-pfc-1b123
## 3     1 69270                   S      A  Fibro_Common_7
## 4     1 76423                   S      A   Common_7_NeuN
## 5     1 83974                   S  AAAAG  Fibro_Common_7
## 6     1 83974                   S      A  Fibro_Common_7
```

Print first the number sample-specific variants:


```r
(singleton.freq <- with(singletons, table(INDV)))
```

```
## INDV
##   Common_7_NeuN  Fibro_Common_7 LBRCE-pfc-1b123 
##           13379           81162           15013
```

Now print their fraction in all  kept variants:


```r
singleton.freq / kept.vars
```

```
## numeric(0)
```

The same information as a barchart:


```r
barchart(singleton.freq, main = "Sample-specific variants")
```

<img src="{{ site.baseurl }}/projects/bsm/R/2017-01-30-common-experiment-snv/figure/barchart-1.png" title="plot of chunk barchart" alt="plot of chunk barchart" width="700px" />

## Discussion
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
