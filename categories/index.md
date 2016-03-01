{% for category in site.categories %}
{% assign t = category | first %}
{% assign posts = category | last %}

## {{ t | downcase }}
{% for post in posts %}
{% if post.categories contains t %}
<a class="post-link" href="{{ post.url | prepend: site.baseurl }}"> {{ post.title }} </a>
{{ post.date | date: "%b %-d, %Y"  }}
{% endif %}
{% endfor %}
{% endfor %}
