---
layout: page
title: Files
---

{% for statfile in site.static_files %}
{% if statfile.path contains "assets" %}
  [ {{ statfile.path | remove: '/assets/' }} ]( {{ statfile.path }} )
    {{ statfile.modified_time | date: "%B %-d, %Y"  }}
{% endif %}
{% endfor %}
