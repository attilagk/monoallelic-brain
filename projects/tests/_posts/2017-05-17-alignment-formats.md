---
layout: default
tags: [ GATK, SAM, BAM, alignment, genome, FASTA ]
---

Variant callers, especially those from the GATK suite, have precise formatting requirements for their input data, the genomic alignments.  The order of contigs in the reference genome, the read group and other annotations is sometimes strictly constrained but these constraints often turn out after failed attempts due to verbose and disorganized documentation.

## Input files

The input files for any somatic variant caller include

1. alignments in SAM/BAM format
    * sorted, indexed 
    * with proper header
1. the reference genome sequence in FASTA format
    * indexed and supplemented with a dictionary

How to prepare and format of these input files?  In particular GATK's MuTect2? GATK is very strict about their preferred SAM header.  Regarding this, the two key points are:

1. contig order: karyographic order of chromosomes followed by non-chromosomal contigs
1. read groups

### Contig order

[This GATK article][inputfaq] details contig order:

>The names and order of the contigs in the reference you used must exactly match that of one of the official references canonical orderings. These are defined by historical karotyping of largest to smallest chromosomes, followed by the X, Y, and MT for the b3x references; the order is thus 1, 2, 3, ..., 10, 11, 12, ... 20, 21, 22, X, Y, MT. The hg1x references differ in that the chromosome names are prefixed with "chr" and chrM appears first instead of last.

However, The Genome Reference Consortium presents its reference genome `Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz` with the chromosomes in lexicographic order (see EMBL's [ftp directory][grc37primary]).  My script `~/bin/grch37-or-grch38-prepare.sh` takes care of this by downloading and concatenating the chromosomal and non-chromosomal contigs in the GATK-compliant order.  The script also creates an index and dictionary file for the reference sequence and, finally, builds index for the bwa and bowtie2 aligners.

### Read groups


Citing again [the GATK article][inputfaq]:

>In addition to being in SAM format, we require the following additional constraints in order to use your file with the GATK:

* The file must be binary (with `.bam` file extension).
* The file must be indexed.
* The file must be sorted in coordinate order with respect to the reference (i.e. the contig ordering in your bam must exactly match that of the reference you are using).
* The file must have a proper bam header with read groups. Each read group must contain the platform (PL) and sample (SM) tags. For the platform value, we currently support 454, LS454, Illumina, Solid, ABI_Solid, and CG (all case-insensitive).
* Each read in the file must be associated with exactly one read group.

To meet the requirement on read groups the output line of `~/bin/parse10x-fnames.1` is

```
echo -r "ID:$ID" -r "LB:$LB" -r "SM:$SM" -r "PU:$PU"
```

where `-r` is the read group option to the `~/bin/align` script, the variable `$ID` stores the read group id, `$LB`: library, `$SM`: sample, and `$PU`: platform unit.  When such expression is used with `~/bin/align`, the `@RG` line in the SAM header will look like

```
@RG	ID:MSSM179_muscle_USPD16080279_HCGHCALXX_L8	LB:USPD16080279	SM:MSSM179_muscle	PU:HCGHCALXX_L8	PL:Illumina
```

## CRAM

Inspecting and reading about bam/cram showed that converting bam files to cram results in 2-3 times compression (relative to bam) but working with the cram files is tedious because their use requires a slow conversion step that involves the reference genome.  Conclusion: this file format is well-suited for long-term storage and data archiving.

[inputfaq]: http://gatkforums.broadinstitute.org/gatk/discussion/1204/what-input-files-does-the-gatk-accept-require
[bamfaq]: http://gatkforums.broadinstitute.org/gatk/discussion/1317/collected-faqs-about-input-files-for-sequence-read-data-bam-cram
[fastafaq]: http://gatkforums.broadinstitute.org/gatk/discussion/1601/how-can-i-prepare-a-fasta-file-to-use-as-reference
[grc37primary]: ftp://ftp.ensembl.org/pub/grch37/current/fasta/homo_sapiens/dna/
[grc38primary]: ftp://ftp.ensembl.org/pub/current_fasta/homo_sapiens/dna/

## Further readings

* [What input files does the GATK accept / require?][inputfaq]
* [Collected FAQs about input files for sequence read data (BAM/CRAM)][bamfaq]
* [How can I prepare a FASTA file to use as reference?][fastafaq]

<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
