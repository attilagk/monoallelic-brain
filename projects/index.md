---
layout: page
title: Projects
---

{% assign projects = "monoallelic-brain;gtex-copd" | split: ';' %}

{% for project in projects %}

---

{% include projects/{{ project }}/description.html %}
See all posts related to this project in the
[ {{ project }} ]( /categories/index.html#{{ project }} ) category.
{% endfor %}
