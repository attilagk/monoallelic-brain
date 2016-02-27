---
layout: page
---

{% for category in site.categories %}
  {% assign t = category | first %}
  {% assign posts = category | last %}

### {{ t | downcase }}
{% for post in posts %}
{% if post.categories contains t %}
[ {{ post.title }} ]( {{ post.url }} )
{{ post.date | date: "%b %-d, %Y"  }}
{% endif %}
{% endfor %}
{% endfor %}
