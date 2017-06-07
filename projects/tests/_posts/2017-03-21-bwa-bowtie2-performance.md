---
layout: default
tags: [ alignment, ]
title: 'Alignment speed: bwa mem vs bowtie2'
---

### Benchmark data

The same Illumina paired DNA sequence reads were taken as test data, each gzipped file roughly 2 GB large:

```
1946M MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1_1.fq.gz*
2242M MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1_2.fq.gz*
```

The reads were aligned to `GRCh37.75.dna.primary_assembly` using 8 threads either with `bwa mem` or `bowtie2`.


### System

All 8 cores of my Lenovo ThinkPad computer (3rd Generation Intel Core i7-3720QM CPU @ 2.60GH x 8, 32 GB RAM).

### Results

The run times show that `bwa mem` is slightly faster than `bowtie2` on this dataset:

```
bwa mem -t 8 ~/data/GRCh37/dna/bwa/Homo_sapiens.GRCh37.75.dna.primary_assembly MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1_* > MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1.sam
real     92m 1.892s
user    687m 20.068s

bowtie2 -p 8 -t -S MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1-bowtie2.sam -x ~/data/GRCh37/dna/bowtie2/Homo_sapiens.GRCh37.75.dna.primary_assembly -1 MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1_1.fq.gz -2 MSSM373_muscle_USPD16080279-D712_H7YNMALXX_L1_2.fq.gz
real    107m 30.539s
user    775m 43.416s
```

Note that the `real` time corresponds to the wall time whose maximum value must be specified with the `-W` option to `bsub`.

These runtimes might be somewhat shorter using the same number (8) of Mothra's Intel Haswell (4rd Generation Intel Core) cores.  The relative performance of Manda's AMD Interlagos cores is unclear to me at this point.
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
