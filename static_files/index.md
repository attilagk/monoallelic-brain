---
layout: page
title: Downloads
---

{% for statfile in site.static_files %}
{% if statfile.path contains "assets" %}
  [ {{ statfile.path | remove: '/assets/' }} ]( {{ statfile.path }} )
    <span class="post-meta">{{ statfile.modified_time | date: "%B %-d, %Y"  }}</span>
{% endif %}
{% endfor %}
