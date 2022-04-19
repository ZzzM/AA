<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title>{{ site.github.project_title }}</title>
        {% for release in site.github.releases %}
            {% unless release.draft %}
                {% unless release.prerelease and page.release_only %}
                    {% if release.body contains '<!--' %}
                    <item>
                        {% assign title = release.name %}
<!--                         {% assign content = release.body | split:'<!--' %}
                        {% assign description = content.first %} -->
                        {% assign arguments = release.body | sparkle_signature %}
                        <title>{{ title }}</title>
                        <description><![CDATA[{{ release.body | markdownify }}]]></description>
                        <pubDate>{{ release.published_at | date_to_rfc822 }}</pubDate>
                        {% for asset in release.assets limit:1 %}
                            <enclosure
                                url="{{ asset.browser_download_url }}"
                                sparkle:version="{{ arguments.first | strip }}"
                                sparkle:shortVersionString="{{ release.tag_name }}"
                                sparkle:edSignature="{{ arguments.last | strip }}"
                                length="{{ asset.size }}"
                                type="application/octet-stream" />
                        {% endfor %}
                    </item>
                    {% endif %}
                {% endunless %}
            {% endunless %}
        {% endfor %}
    </channel>
</rss>
