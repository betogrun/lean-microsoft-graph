# frozen_string_literal: true

require_relative "lib/lean_microsoft_graph/version"

Gem::Specification.new do |spec|
  spec.name = "lean-microsoft-graph"
  spec.version = LeanMicrosoftGraph::VERSION
  spec.authors = ["Alberto Rocha"]
  spec.email = ["betogrun@gmail.com"]

  spec.summary = "'lean-microsoft-graph' is a gem is a simple interface to Microsoft Graph API."
  spec.description = "This gem provides a set of methods to interact with Microsoft Graph API."
  spec.homepage = "https://github.com/betogrun/lean-microsoft-graph"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/betogrun/lean-microsoft-graph"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 1.10'
  spec.add_dependency 'faraday_middleware', '~> 1.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
