<div>
  {% capture index %}
  {% include a.md %}
  {% endcapture %}
  
  {{ index | markdownify }}
</div>
