---
layout: default
tags: [discussion, modeling]
---

In this note I identify some shortcomings of our project "monoallelic expression in the brain" in its present state (see the [project page], [slides] and [manuscript]), discuss their impact on the study, and make suggestions for amendments.  In short, those shortcomings are the implicit treatment of...

1. the possible levels of allelic exclusion (a parameter of interest)
2. various model families specifying the distribution of the key statistic $$\{S_{ig}\}_{ig}$$ given the level of allelic exclusion and all other parameters
3. variation among genes and individuals (subjects)
3. the plausibility of various *model structures* considered,

where model structure depends on the first three points, and $$\{S_{ig}\}_{ig}$$ will be introduced shortly.  As explained subsequently, the shortcomings impede addressing the **main questions** of our study:
 
* overall extent
    a. (two state model of allelic exclusion) how many genes in how many individuals are m.a.e.?
    b. (multi state model) how are genes and individuals distributed according to the strength of allelic exclusion?
* DLPFC tissue specific pattern; novel m.a.e. genes
* regulation of allelic exclusion: dependence on explanatory variables (age,...)

## Preliminaries: data, sufficiency, inference, model assessment

Genome-wide observations on $$m$$ genes are based on post mortem tissue samples from the DLPFC of $$n$$ individuals.  For each individual $$i$$ and gene $$g$$ a statistic $$s_{ig}$$ was derived from the observed SNP-array and RNA-seq data.  The $$n \times p$$ matrix $$X$$ contains observations on all individuals and $$p$$ variables including age of death and psychological condition (e.g. schizophrenia).

In this note I align with the preceding analysis and assume that given $$X$$ the random variables $$\{S_{ig}\}_{ig}$$ are sufficient statistics for the parameters $$\theta$$ (including the level of allelic exclusion) of all model structures under consideration.  This likely false but attractively simple assumption means that the complete data (from the SNP-array and RNA-seq measurements) carry no more information on $$\theta$$ than $$\{S_{ig}\}_{ig}$$ do, so it is sufficient to draw inferences solely from the latter (in combination with $$X$$, of course).  I will not discuss sufficiency of $$\{S_{ig}\}_{ig}$$ further in this document.

Ideally, $$\theta$$ will carry information on the main questions above.  The nature of that information depends on the actual form of $$\theta$$, which is tied to model structure.  The information in $$\theta$$ further depends on its mechanistic interpretation and the errors with which it is inferred from $$\{S_{ig}\}_{ig}$$.  In case of several plausible candidate models, a single or at most a few preferred ones need to be selected by likelihood based criteria like AIC or BIC (to which an alternative is Bayesian model averaging).

## Levels of allelic exclusion

In the simplest case allelic exclusion has only *two levels* so that any gene $$g$$ (in any individual $$i$$) is either bi or monoallelically expressed.  Then $$\theta = \{ \{\alpha_{ig}\}_{ig},...\}$$, where for each $$i,g$$ pair $$\alpha_{ig}$$ may only equal 0 or 1 (for biallelic and monoallelic expression, say).  Inferring $$\alpha_{ig}$$ is the same as testing the hypothesis $$H_0$$ of biallelic expression against that ($$H_1$$) of monoallelic expression (in $$H_0$$ and $$H_1$$ the $$ig$$ subscript was suppressed for clarity).

In a more general, *multi level*, model family the allelic exclusion of $$g$$ may also occupy one or more intermediate states reflecting the strength/grade of exclusion. As will be discussed later together with the regression analysis, the multi state model might be preferred.  Note that the definition of intermediate states is a more delicate issue than that of the extreme states; ideal definitions are based on natural quantities (e.g. allele-specific transcription rate) so that they are widely accepted in the research field.

How such quantities are mechanistically related to $$S_{ig}$$ through the RNA-seq and SNP-array data is crucial but is not discussed here.

The manuscript does indeed seem to consider both model families at different points. 

Next I present classes (events) defined in the manuscript based on $$s_{ig}$$ and give a possible interpretation under each model family.  Then I discuss how the mentioned shortcomings may impede addressing some of the questions above.

### Classes and their interpretations

Figure 1 (slide 1) and S4 (slide 14) on the [slides] show, for each gene $$g$$, the distribution of individuals $$i$$ into 4 classes depending on $$s_{ig}$$.  These classes are denoted here as $$A_1, A_2, A_3, B$$ and are color coded in the figures.  The following table summarizes the definition of classes and their interpretations under the two and a multi state model.

|       class       |      $$A_1$$        |      $$A_2$$        |       $$A_3$$       |      $$B$$          |
|:-----------------:|:-----------------:|:-----------------:|:-----------------:|:-----------------:|
| color code        | dark blue/green/red  | light blue/green/red |      gray         |       black       |
|    definition     | $$s_{ig} \in (0.9, 1]$$ | $$s_{ig} \in (0.8, 0.9]$$ | $$\Omega \setminus (A_1 \cup A_2 \cup B)$$ | $$s_{ig} \approx 0.5$$ and $$0.7 \notin \mathrm{CI}_{95 \%}$$ |
| interpr., two  state m. | $$H_1$$ strongly supported | $$H_1$$ weakly supported | neither $$H_0$$ nor $$H_1$$ are supported | $$H_0$$ supported |
| interpr., multistate m. | strong allelic excl. | medium allelic excl. | weak allelic excl. | no allelic exlc. |

Even when there are only a few intermediate states (for the case of two such states $$A_2, A_3$$, see the table), the definition of those states is not as obvious as in the two state case.

Note that the interpretation of the intermediate classes $$A_2$$ and $$A_3$$, under both models, are complicated by cell-to-cell variability within the DLPFC of an individual, reflecting random m.a.e. and/or variability in imprinting.  Further complication is caused by the possibility of dynamically changing state within single cells.

More importantly, how are the two and multi state models relate to the question of overall extent?

### Impact of shortcomings on estimating the extent of m.a.e.

#### Two state model

Under this model family the quantity of interest is $$m_{i0} = \# \{g:g$$ is biallelically expressed in individual $$i\}$$ and $$m_{i1} = m_{i0} - m$$, the corresponding number for m.a.e.  While $$m=m_1=...m_n$$ is taken as known (and the same for all individuals), the value of $$m_{i0}$$, and hence $$m_{i1}$$ too, is uncertain and may vary among individuals (see Variation among individuals and regression below).  The frequentist approach treats $$m_{i0}$$ as a fixed but unknown numbers while the Bayesian one views $$M_{0i}$$ as a random variable.  But, what is common to both approaches, is that the distribution of $$S_{ig}$$ must be fully specified under $$H_0$$ (and at least partially under $$H_1$$) to derive rates of misclassification and eventually estimate $$m_{i0}$$ and $$m_{i1}$$.

For instance, [Storey and Tibshirani] present a frequentist approach to estimating $$m_{i0}$$ in their classic paper as a byproduct of finding optimal procedure to control false discovery rate.  Their approach first derives the p-value (a minimal false positive error rate) for each gene $$g$$ from the distribution under $$H_0$$ of a test statistic (like $$S_{ig}$$ in the present case).  It then estimates $$m_0$$ from the observed (empirical) distribution of p-values based on theory and assumptions related to the distributions under $$H_0$$ and $$H_1$$.

The analysis in the [manuscript] does not provide such estimates of $$m_{i0}$$ and $$m_{i1}$$ for individuals $$i=1,...,n$$, even though the distribution(s) of $$\{S_{ig}\}_{ig}$$ under $$H_0$$ was evidently specified to derive 95 % confidence intervals for some parameter of that distribution (see the definition of $$B_1$$ in table above).  **That null distribution would**, in principle, **allow the extension of the present work** through the evaluation of p-values and the estimation of $$m_{i0}$$ and $$m_{i1}$$ using e.g. the method of Storey and Tibshirani.

#### Multi state model

Under this model family, the extent of m.a.e. cannot be expressed as simply as before (simply by a single number $$m_{i1}$$ or, equivalently, $$m_{i0}$$).  Rather, probabilities of sets of states must be given for a given individual or, equivalently, the expected number of genes in those sets.

### Impact on classification of genes

The [manuscript] appears to consider the *two* state model family in the beginning of Results (`Pipeline` and `Landscape of monoallelic expression...` subsections) by formulating a *binary* classification problem for each $$j,g$$ pair.  It presents discoveries of "known imprinted genes and novel candidates" but without error rates of misclassification.  Viewing for instance the novelty detection side of classification, there is no confidence

the current definition of classes $$A_1, A_2, A_3, B$$ is arbitrary and has no probabilistic foundation, perhaps with the exception of $$B$$ (hence the different notation).  Therefore, we cannot tell in terms of two misclassification error rates (e.g. FPR, FNR) how strongly $$H_0$$ or $$H_1$$ supported for gene $$g$$ in individual $$i$$ by the observed $$s_{ig}$$.  Class $$A_3$$---gray on Figure 1 (slide 1) and S4 (slide 14) on the [slides]---"is considered 'indeterminate'", as stated on p6 of the [manuscript].

By looking at the distribution of individuals among the four classes for 100 randomly chosen genes in Figure S4 (slide 14) of the [slides] we see that for most genes most individuals are "grey".  Should we consider these as instances of mono ($$H_1$$) or biallelic ($$H_0$$) expression?

Indeed on p4 of the [manuscript] the first sentence of the Results section states "...we analyzed the data to assess whether it is more consistent with with monoallelic vs. biallelic expression."

On the one hand it "calls" bi and monoallelic

## Variation among genes, individuals and regression

## Model selection

[manuscript]: https://docs.google.com/document/d/1cWd4UH98SJR5lihDihC0ZO-C_A1-8MQ5COcixxCLzHE/edit?usp=sharing
[project page]: http://katahdin.mssm.edu/ifat/web/cm/home
[slides]: https://docs.google.com/presentation/d/1YvpA1AJ-zzir1Iw0F25tO9x8gkSAzqaO4fjB7K3zBhE/edit?usp=sharing
[Storey and Tibshirani]: http://www.pnas.org/content/100/16/9440.full
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
