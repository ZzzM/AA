module Jekyll
  module BuildFilter
    def sparkle_build(release_body)
      regex = /<!-- build=(?<build>.*) -->/m
      build = release_body.match(regex).named_captures["build"]
      raise "Didn't find a build in the release body." if build.empty?
      build
    end
  end
end

Liquid::Template.register_filter(Jekyll::BuildFilter)
