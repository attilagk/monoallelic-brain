---
layout: default
tags: [ chaggai, reproducible-research, programming ]
---

## Outline

### Subtitle

#### Subsubtitle

1. insert a brand new document
2. mathematical typesetting with $$\LaTeX$$
1. dynamic documents
3. real analysis

## Inserting a new document

Almost done.  But we're going to use dynamic docs and render them with `R`.  We can set hyperlinks to [a page on the Internet] or a previous post in our lab-notebook.  We can set hyperlinks to [ Google ] or a previous post in our lab-notebook.

Now we are in the `Rmd` dynamic document.


```r
1 + 1
```

```
## [1] 2
```

## Mathematical typesetting

Leonhard Euler made very important contributions to mathematics.

![euler](euler.jpg)

Euler's formula $e^{ix} = \cos x + i \sin x$.
$$
\begin{equation}
\cos x = \frac{e^{ix} + e^{-ix}}{2}
\end{equation}
$$
and that
$$
\begin{equation}
\sin x = \frac{e^{ix} - e^{-ix}}{2i}
\end{equation}
$$
Why is it useful?  Because we can define trigonometric functions based on the power series
$$
\begin{equation}
e^z = \sum_{n=0}^\infty \frac{z^n}{n!},
\end{equation}
$$
where $z$ is complex.

## Dynamic documents

Create an anonymous `R` function.  This function corresponds to `tan`, the tangent function. Evaluating it at `pi/2` gives approx. $0$ and at `pi/4` gives $1$.

```r
(function(y) sin(y) / cos(y))(pi/4)
```

```
## [1] 1
```

Is the anonymous function **really** the same as `tan`?

```r
tan(pi/4)
```

```
## [1] 1
```
It seems so.
Inline code: `tan(pi/4)` is evaluated as 1 using `knitr` by default.  In other words, `tan(pi/4)` = 1.

Plot an interesting function called `foo`


```r
foo <- function(y) sin(1 / y)
curve(foo, from=-1, to=1, n=1001, type='l')
```

```
## Warning in sin(1/y): NaNs produced
```

![plot of chunk unnamed-chunk-4]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-25-live-demonstration/figure/unnamed-chunk-4-1.png)

## Other languages

Fooling with `tr` utility using `bash`:



```bash
D=$(date)
echo $D
echo $D | tr '[:lower:]' '[:upper:]'
echo $D | tr '[:upper:]' '[:lower:]'
echo $D | tr '[:lower:][:upper:]' '[:upper:][:lower:]'
```

```
## Tue Jun 6 19:07:17 EDT 2017
## TUE JUN 6 19:07:17 EDT 2017
## tue jun 6 19:07:17 edt 2017
## tUE jUN 6 19:07:17 edt 2017
```

Fibonacci series up to 7 terms in `python`:



```python
def fib(n):
    if n == 1 or n == 0:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

print fib(7)
```

```
## 21
```

The analogous implementation in `R`:



```r
fib <- function(n) {
    if (n %in% 0:1) 1
    else fib(n - 1) + fib(n - 2)
}
fib(7)
```

```
## [1] 21
```

## Age of death and other variables


```r
csv <- '/home/attila/projects/monoallelic-brain/data/ifat/age-dependence/samples.csv'
samples <- read.csv(csv)
names(samples)
```

```
##  [1] "ID"                                               
##  [2] "Individual.ID"                                    
##  [3] "RNAseq_ID"                                        
##  [4] "DNA_report..Genotyping.Sample_ID"                 
##  [5] "Institution"                                      
##  [6] "Gender"                                           
##  [7] "Ethnicity"                                        
##  [8] "Age.of.Death"                                     
##  [9] "Dx"                                               
## [10] "DNA_isolation..Sample.DNA.ID"                     
## [11] "DNA_report..Genotyping.Sample_ID.1"               
## [12] "DLPFC_RNA_dissection..Institution.DLPFC.Sample.ID"
## [13] "FPKM_ID"                                          
## [14] "Ancestry.EV.1"                                    
## [15] "Ancestry.EV.2"                                    
## [16] "Ancestry.EV.3"                                    
## [17] "Ancestry.EV.4"                                    
## [18] "Ancestry.EV.5"                                    
## [19] "DLPFC_RNA_ID"
```


![plot of chunk unnamed-chunk-10]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-25-live-demonstration/figure/unnamed-chunk-10-1.png)


```r
levels(samples$Institution)
```

```
## [1] "MSSM" "Penn" "Pitt"
```
![plot of chunk unnamed-chunk-12]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-25-live-demonstration/figure/unnamed-chunk-12-1.png)

```r
levels(samples$Dx)
```

```
## [1] "BP"      "Control" "SCZ"
```

![plot of chunk unnamed-chunk-14]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-25-live-demonstration/figure/unnamed-chunk-14-1.png)
![plot of chunk unnamed-chunk-15]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-25-live-demonstration/figure/unnamed-chunk-15-1.png)

[a page on the Internet]: http://jupyter.org
[ Google ]: http://google.com
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
