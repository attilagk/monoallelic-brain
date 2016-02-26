---
layout: page
title: Tags
---

{% for tag in site.tags %}
  {% assign t = tag | first %}
  {% assign posts = tag | last %}

### {{ t | downcase }}
{% for post in posts %}
{% if post.tags contains t %}
[ {{ post.title }} ]( {{ post.url }} )
{{ post.date | date: "%B %-d, %Y"  }}
{% endif %}
{% endfor %}
{% endfor %}
