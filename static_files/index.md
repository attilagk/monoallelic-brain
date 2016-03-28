---
layout: page
title: Downloads
---

{% assign fs = site.static_files | sort: 'modified_time' %}
{% for statfile in fs reversed %}
{% if statfile.path contains "assets" %}
  [ {{ statfile.path | remove: '/assets/' }} ]( {{ site.baseurl }}{{ statfile.path }} )
    <span class="post-meta">{{ statfile.modified_time | date: "%B %-d, %Y"  }}</span>
{% endif %}
{% endfor %}
