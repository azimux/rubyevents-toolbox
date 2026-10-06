require_relative "version"

Gem::Specification.new do |spec|
  spec.name = "rubyevents-toolbox"
  spec.version = Azimux::RubyeventsToolbox::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "Various commands to help with adding content to rubyevents.org or whatever"
  spec.homepage = "https://github.com/azimux/rubyevents-toolbox"
  spec.license = "MPL-2.0"
  spec.required_ruby_version = Azimux::RubyeventsToolbox::MINIMUM_RUBY_VERSION

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir[
    "lib/**/*",
    "src/**/*",
    "LICENSE*.txt",
    "README.md",
    "CHANGELOG.md"
  ]

  spec.add_dependency "foobara", ">= 0.6.5", "< 2.0.0"
  spec.add_dependency "foobara-llm-backed-command", "< 2.0.0"

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
