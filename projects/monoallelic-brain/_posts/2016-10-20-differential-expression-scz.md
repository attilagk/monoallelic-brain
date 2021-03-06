---
layout: default
tags:
title: Differentially Expressed Genes in Schizophrenia
featimg: "venn-triple-1.png"
---

This analysis compares some gene sets raised by our study to the set of differential expressed genes in schizophrenia (SCZ) presented by ([Fromer et al 2016](http://www.nature.com/neuro/journal/vaop/ncurrent/full/nn.4399.html)) in their article *Gene expression elucidates functional impact of polygenic risk for schizophrenia*.  For discussion see the post [about affected genes]({{ site.baseurl }}{% post_url /projects/monoallelic-brain/2016-10-19-about-affected-genes %}).


```
## Error in library(VennDiagram): there is no package called 'VennDiagram'
```

## Import data


```r
diff.e.genes <- read.csv("../../data/fromer-2016-nat-neurosci/nn.4399-S5.csv", skip = 1)
our.genes <- list()
# the selected genes that were analyzed using regression
our.genes$selected <- as.character(read.csv("../../data/genes.regression.new")[[1]])
# the genes with significant association to some biological predictor
our.genes$signif <- as.character(read.csv("../../results/signif-gene-effects-either.csv")[[1]])
```

## Results

The following genes were found to be differentially expressed by Fromer et al **AND**

1. either were merely selected for analysis in our study
1. or, furthermore, we found their parental expression bias to be significantly associated to some biological predictor


```r
(both <- lapply(our.genes, intersect, levels(diff.e.genes$Gene.Symbol)))
```

```
## $selected
## [1] "PEG10" "IGF2" 
## 
## $signif
## [1] "PEG10"
```

The characteristics of the expression change for the selected genes:


```r
diff.e.genes[diff.e.genes$Gene.Symbol %in% both$selected, c("Gene.Symbol", "logFC", "p.value")]
```

```
##    Gene.Symbol  logFC  p.value
## 44        IGF2 -0.406 1.15e-05
## 98       PEG10  0.152 5.71e-05
```

Further information on the significant gene(s):


```r
read.csv("../../results/signif-gene-effects-either-manual-annot.csv", row.names = 1)[both$signif, ]
```

```
##                   Description      Gene.type Chromosome.Name
## PEG10 paternally expressed 10 protein_coding               7
##       Gene.Start..bp. rank..our.study. Associated.coefficient..our.study.
## PEG10        94656325               14                              DxSCZ
##       Phenotype     PMID
## PEG10           16341224
```


```r
grid.draw(venn.diagram(list(diff.e.genes$Gene.Symbol, our.genes$selected, c("RP11-909M7.3", "PEG10", "MEST", "UBE3A")), filename=NULL, category = c("SCZ: overall expression", "called imprinted", "SCZ: parental bias"), ext.text = FALSE, cat.pos = c(-15, 15, 15), cat.cex = rep(1.2, 3), col = my.col <- c("darkgreen", "blue", "red"), fill = my.col, cat.col = my.col))
```

```
## Error in grid.draw(venn.diagram(list(diff.e.genes$Gene.Symbol, our.genes$selected, : could not find function "grid.draw"
```

Out of the 15 genes that our study found to be significantly associated to some biological predictor in terms of allelic bias, only 1 of them, PEG10, was/were found to be differentially expressed by Fromer et al.
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
