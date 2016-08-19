---
layout: post
tags: [ regression, interaction, random-effects, ]
---

The present article extends previous inference of regression parameters $$\beta$$ (see [extending ANOVA]({{ site.baseurl }}{% post_url 2016-06-22-extending-anova %})) with a conditional analysis.  Operationally, conditioning takes a subset of all observations (i.e. individuals/RNA preparations) defined by a **condition**.  In the present, rather special, case a condition is defined by a single *level* of a single *factor*-type (i.e. categorical) predictor/explanatory variable.  However, more general conditioning setups could also be explored.  In that case multiple predictors might be selected, of which some might be continuous (i.e. a *covariate*) while others categorical, and for each predictor a possibly compound event (e.g. multiple levels of a factor) might be taken.

The choice of Institution and Gender as selected predictors for conditioning is motivated by the fact that they are categorical with 3 and 2 levels, respectively, and that they are clearly associated with Age (see "scatter plot matrices" in [this article]({{ site.baseurl }}{% post_url 2016-06-26-trellis-display-of-data %})).

{% include projects/monoallelic-brain/2016-07-08-conditional-inference.html %}
