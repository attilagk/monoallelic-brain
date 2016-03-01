---
layout: post
---

# Title 1

## Title 2

### Title 3

#### Title 4

## Math rendering

The inline equation $$\Gamma(x) = \int_0^\infty t^{x-1} e^{-t} \mathrm{d} t$$ and $$\Gamma \left( \frac{1}{2} \right) = \pi$$, and below their counterparts in a $$\LaTeX$$ `eqnarray` environment

$$
\begin{eqnarray}
\Gamma(x) &=& \int_0^\infty t^{x-1} e^{-t} \mathrm{d} t \\
\Gamma \left( \frac{1}{2} \right) &=& \pi
\end{eqnarray}
$$

Maximum likelihood estimator $$\hat{\beta}$$ of regression coefficient $$\beta$$ in normal linear model $$y = X \beta + \epsilon$$:

$$
\begin{equation}
\hat{\beta} = (X^\top X)^{-1} X^\top y
\end{equation}
$$

## Code evaluation

Below is an R code with the backtick '\'' (knitr default) fence


~~~r
(function(x) {
    sin(x) / cos(x)
})(pi/4)
~~~

~~~
## [1] 1
~~~

~~~r
tan(pi/4)
~~~

~~~
## [1] 1
~~~

Test inline code: `tan(pi/4)` is evaluated as 1 using knitr by default.  In other words, `tan(pi/4)` = 1.

Plot an interesting function called `foo`


~~~r
foo <- function(y) sin(1 / y)
curve(foo, from=-1, to=1, n=1001, type='l')
~~~

~~~
## Warning in sin(1/y): NaNs produced
~~~

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) 

### Various language engines

Fooling with `tr` utility using bash:


~~~bash
D=$(date)
echo $D
echo $D | tr '[:lower:]' '[:upper:]'
echo $D | tr '[:upper:]' '[:lower:]'
echo $D | tr '[:lower:][:upper:]' '[:upper:][:lower:]'
~~~

~~~
## Mon Feb 8 19:54:41 EST 2016
## MON FEB 8 19:54:41 EST 2016
## mon feb 8 19:54:41 est 2016
## mON fEB 8 19:54:41 est 2016
~~~

Fibonacci series up to 7 terms in python:


~~~python
def fib(n):
    if n == 1 or n == 0:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

print fib(7)
~~~

~~~
## 21
~~~

The analogous implementation in R:


~~~r
fib <- function(n) {
    if (n %in% 0:1) 1
    else fib(n - 1) + fib(n - 2)
}
fib(7)
~~~

~~~
## [1] 21
~~~

### Setting a knitr hook function


~~~r
knit_hooks$set(date_hook = function(before, options, envir) if(before) date())
~~~

Below is an empty code block with chunk option `date_hook=TRUE`, where the hook function is defined as `date_hook = function(before, options, envir) if(before) date()` and passed as an argument to the `knit_hooks$set` function.

Mon Feb  8 19:54:41 2016

## Miscellaneous features

The following features are illustrated here

* nested lists
  1. the likelihood equation $$\ell'(\hat{\theta}; y)=0$$
  2. observed informatioin $$J(\theta) = - \ell''(\theta; y)$$
  2. Fisher information $$I(\theta) = - \mathrm{E} \ell''(\theta; Y)$$
* a link to [my website]
* and a table explaining true/false positives/negatives

|                 | called positive | called negative |
| ---------------:|:---------------:|:---------------:|
| actual positive |       TP        |       FN        |
| actual negative |       FP        |       TN        |

[my website]: http://attilagk.com
