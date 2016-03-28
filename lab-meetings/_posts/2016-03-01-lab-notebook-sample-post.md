---
layout: post
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
    * to [a post] on this locally hosted site
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

{% include lab-meetings/2016-03-01-lab-notebook-sample-post.html %}

## Real World examples

See [a post], all posts sorted by date, categories or tags.

## To do: hosting and more

* availability: intra vs internet
* authentication (contra open science)
* notification: `RSS`
* comments?
* multiple authors?

## Bibliography

{% bibliography --file 2016-03-01-lab-notebook-sample.bib %}

[my website]: http://attilagk.com
[a post]: {% post_url 2016-02-15-mixture-distribution %}
[sinefig]: {{ site.baseurl }}/assets/lab-meetings/2016-03-01-lab-notebook-sample-post/unnamed-chunk-2-1.png
[shotton.pdf]: {{ site.baseurl }}/assets/lab-meetings/2016-03-01-lab-notebook-sample-post/Shotton2009.pdf
[shotton.html]: http://svn.code.sf.net/p/enhancedplospaper/code/trunk/paper/index.html
