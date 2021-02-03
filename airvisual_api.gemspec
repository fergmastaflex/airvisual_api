require_relative 'lib/airvisual_api/version'

Gem::Specification.new do |spec|
  spec.name          = "airvisual_api"
  spec.version       = AirVisualApi::VERSION
  spec.authors       = ["Joey Ferguson"]
  spec.email         = ["fergmastaflex@gmail.com"]

  spec.summary       = 'Ruby wrapper for IQAir\'s AirVisual API'
  spec.description   = 'A Ruby interface to retrieve air quality data from the AirVisual API based on various location types'
  spec.homepage      = "http://github.com/airvisual_api"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/airvisual_api"
  spec.metadata["changelog_uri"] = "http://github.com/airvisual_api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'httparty'
end
