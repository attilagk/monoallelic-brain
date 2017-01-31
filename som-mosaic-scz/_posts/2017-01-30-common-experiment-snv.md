---
title: Somatic SNVs and Indels by HaplotypeCaller
layout: post
---

## Introduction

From Alison Barton in Peter Park's lab we received a set of annotated SNV and indel variants called by the GATK [HaplotypeCaller] based on three samples from the same individual:

1. Fibro_Common_7 (fibroblasts)
1. Common_7_NeuN (sorted NeuN+ neurons from the dorsolateral prefrontal cortex DLFPC)
1. LBRCE-pfc-1b123 (tissue from the PFC)

This analysis summarizes the more than 4 million variants in the vcf file `Common_experiment_HC.vqsr.snp.indel.vcf.gz` provided by Alison on 2017-01-24.  In particular, those variants are in focus that are specific to either of the three samples since these represent some type of somatic mozaicism.  See the *Discussion* below on how somatic mozaicism may be interpreted given the present statistical approach (HaplotypeCaller).

Open [snv-2017-01-24.1-1000.tsv] to look at the first thousand variants and their annotations in an Excel-like program.  Similarly, open [snv-2017-01-24.Fibro_Common_7.recode.tsv] for somatic variants specific to the fibroblast sample (equivalently, brain specific variants).

{% include projects/som-mosaic-scz/2017-01-30-common-experiment-snv.html %}

[snv-2017-01-24.1-1000.tsv]: {{ site.baseurl}}/assets/projects/som-mosaic-scz/snv-2017-01-24.1-1000.tsv
[snv-2017-01-24.Fibro_Common_7.recode.tsv]: {{ site.baseurl}}/assets/projects/som-mosaic-scz/snv-2017-01-24.Fibro_Common_7.recode.tsv
[HaplotypeCaller]: https://software.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php
