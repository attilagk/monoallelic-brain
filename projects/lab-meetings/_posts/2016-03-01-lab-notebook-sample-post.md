---
layout: default
comments: true
tags: [ semantic-publication, lab-notebook, programming, reproducible-research ]
---

## Introduction

### Motivation

* efficient research, collaboration & communication (publication)
* transparency, manageability, reproducibility
* leverage emerging trends & technologies

### Concepts

* mixing natural and programming languages
    * *semantic publishing*: natural l. $$ \rightarrow $$ programming l.
    * *literate programming*: natural l. $$ \leftarrow $$ programming l.
* program evaluation, dynamic documents
* semantic publishing
* open science

### Technicalities

* `W3C`, semantic web
* website and pages; blog and posts
* host: local/remote
* static/dynamic generation
* `Markdown` to `HTML` conversion
    * *typesetting*, $$\LaTeX$$
    * weaving, dynamic document, `knitr`
* version control & repositories: `git` & `GitHub`

## Demonstration

### Typesetting

* writing nested lists and inline equations with $$\LaTeX$$
  1. the likelihood equation $$\ell'(\hat{\theta}; y)=0$$
  2. observed informatioin $$J(\theta) = - \ell''(\theta; y)$$
  2. Fisher information $$I(\theta) = - \mathrm{E}[ \ell''(\theta; Y) ]$$
* hyperlinks
    * to my personal [home page][my website]
    * to posts on this locally hosted site
    * citing an insightful theoretical paper {% cite Dawid1981 --file 2016-03-01-lab-notebook-sample.bib %}, a widespread method of FDR control {% cite Storey:2003kx --file 2016-03-01-lab-notebook-sample.bib %} and a refreshing work on semantic publishing {% cite Shotton2009 --file 2016-03-01-lab-notebook-sample.bib %}, see pdf [here][shotton.pdf] and semantically enhanced [article][shotton.html] on the web

The *gamma function* is closely related to the following distributions: gamma, beta and normal.  Two equations to remember:

$$
\begin{eqnarray}
\Gamma(x) &=& \int_0^\infty t^{x-1} e^{-t} \mathrm{d} t \qquad \text{gamma function} \\
\Gamma \left( \frac{1}{2} \right) &=& \pi \qquad \text{cf. normal distribution}
\end{eqnarray}
$$

Maximum likelihood estimator $$\hat{\beta}$$ of regression coefficient $$\beta$$ in normal linear model $$y = X \beta + \epsilon$$:

$$
\begin{equation}
\hat{\beta} = (X^\top X)^{-1} X^\top y
\end{equation}
$$

A table explaining true/false positives/negatives:

|                 | called positive | called negative |
| ---------------:|:---------------:|:---------------:|
| actual positive |       TP        |       FN        |
| actual negative |       FP        |       TN        |

### Code evaluation

#### `R` language

Below is the R code with the backtick '\'' (knitr default) fence



```r
(function(x) {
    sin(x) / cos(x)
})(pi/4)
```

```
## [1] 1
```


```r
tan(pi/4)
```

```
## [1] 1
```

Test inline code: `tan(pi/4)` is evaluated as 1 using knitr by default.  In other words, `tan(pi/4)` = 1.

Plot an interesting function called `foo`


```r
foo <- function(y) sin(1 / y)
curve(foo, from=-1, to=1, n=1001, type='l')
```

```
## Warning in sin(1/y): NaNs produced
```

![plot of chunk unnamed-chunk-3]({{ site.baseurl }}/projects/lab-meetings//R/2016-03-01-lab-notebook-sample-post/figure/unnamed-chunk-3-1.png)

#### Other languages

Fooling with `tr` utility using `bash`:



```bash
D=$(date)
echo $D
echo $D | tr '[:lower:]' '[:upper:]'
echo $D | tr '[:upper:]' '[:lower:]'
echo $D | tr '[:lower:][:upper:]' '[:upper:][:lower:]'
```

```
## Tue Jun 6 19:02:19 EDT 2017
## TUE JUN 6 19:02:19 EDT 2017
## tue jun 6 19:02:19 edt 2017
## tUE jUN 6 19:02:19 edt 2017
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


## Real World examples

See all posts sorted by date, categories or tags.

## To do: hosting and more

* availability: intra vs internet
* authentication (contra open science)
* notification: `RSS`
* comments?
* multiple authors?

## Bibliography

{% bibliography --file 2016-03-01-lab-notebook-sample.bib %}

[my website]: http://attilagk.com
[sinefig]: {{ site.baseurl }}/assets/lab-meetings/2016-03-01-lab-notebook-sample-post/unnamed-chunk-2-1.png
[shotton.pdf]: {{ site.baseurl }}/assets/lab-meetings/2016-03-01-lab-notebook-sample-post/Shotton2009.pdf
[shotton.html]: http://svn.code.sf.net/p/enhancedplospaper/code/trunk/paper/index.html
<!-- MathJax scripts -->
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
