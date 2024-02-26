# frozen_string_literal: true

require_relative "lib/who_delegated/version"

Gem::Specification.new do |spec|
  spec.name        = "who_delegated"
  spec.version     = WhoDelegated::VERSION
  spec.authors     = ["Sampo Kuokkanen"]
  spec.email       = ["sampo.kuokkanen@gmail.com"]
  spec.homepage    = "https://github.com/sampokuokkanen/who_delegated"
  spec.summary     = "Rails: Find out if a method was delegated to an object."
  spec.description = "Was your Rails method delegated? Or not? That is the question. So find out with this gem!"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
  # rubocop:disable Gemspec/RequireMFA
  spec.metadata["rubygems_mfa_required"] = "false"
  # rubocop:enable Gemspec/RequireMFA
end
