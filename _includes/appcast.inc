<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title>{{ site.github.project_title }}</title>
        {% for release in site.github.releases %}
            {% unless release.draft %}
                {% unless release.prerelease and page.release_only %}
                    {% assign flag = '<?>' %}
                    {% if release.body contains flag %}
                    <item>
                        {% assign title = release.name %}
                        {% assign contents = release.body | split:flag | strip %}
                        {% assign description = contents.first %}
                        {% assign arguments = contents.last | split:',' | strip %}
                        <title>{{ title }}</title>
                        <description><![CDATA[{{ description | markdownify }}]]></description>
                        <pubDate>{{ release.published_at | date_to_rfc822 }}</pubDate>
                        {% for asset in release.assets limit:1 %}
                            {{ arguments }}
                        {% endfor %}
                    </item>
                    {% endif %}
                {% endunless %}
            {% endunless %}
        {% endfor %}
    </channel>
</rss>
