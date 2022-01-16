--h
layout: home
---

# About Dre

Hi, I am a programmer with electronics and robotics experience. 

Currently enjoying working for Octopus Energy and living in Illabunda Eco village with his wife and newborn baby.

There's not a lot of information here, unfortunately, as I'm still trying to find things to say; but feel free to check out 
some related [tags](/tags/) and categories to get a feel for what I talk about.

## Blog posts:
{% for post in site.posts %}
<h3 style='margin-top: 1em; margin-bottom: 0em;'><a href="{{post.url}}">{{post.title}}</a></h3>
<span><small><strong>{{ post.date | date: "%e %B %Y" }}</strong> . {{ post.category }}</small></span>
{% endfor %}
