<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title>Change Log</title>
        {% for release in site.github.releases %}
            {% unless release.draft %}
                {% unless release.prerelease and page.release_only %}
                    <item>
                        <title>{{ release.name }}</title>
                        <description><![CDATA[{{ release.body | markdownify }}]]></description>
                        <pubDate>{{ release.published_at | date_to_rfc822 }}</pubDate>
                        {% for asset in release.assets limit:1 %}
      
                            {% assign tag_name = release.tag_name | replace_first:')','' | split:'(' %}
                            {% assign version_name = tag_name[0] %}
                            {% assign build_name = tag_name[1] %}

                            <enclosure
                                url="{{ asset.browser_download_url }}"
                                sparkle:version="{{ build_name }}"
                                sparkle:shortVersionString="{{ version_name }}"
                                length="{{ asset.size }}"
                                type="application/octet-stream" />

                        {% endfor %}
                    </item>
                {% endunless %}
            {% endunless %}
        {% endfor %}
    </channel>
</rss>
