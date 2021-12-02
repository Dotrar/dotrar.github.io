---
layout: home
---
<hr>

{% for post in site.posts %}	
<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
<p><small><strong>{{ post.date | date: "%e %B %Y" }}</strong> . {{ post.category }} . <a href="http://erjjones.github.com{{ post.url }}#disqus_thread"></a></small></p>			
{% endfor %}
