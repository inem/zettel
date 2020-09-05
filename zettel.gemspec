lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zettel/version"

Gem::Specification.new do |spec|
  spec.name = %q{zettel}
  spec.authors       = ["Ivan Nemytchenko"]
  spec.email         = ["nemytchenko@gmail.com"]
  spec.version = Zettel::VERSION
  spec.date = %q{2020-09-05}
  spec.summary = %q{Zettel is a tool to work with markdown notes. Supports frontmatter, titles, tags, etc}
  spec.files = [
    "lib/zettel.rb"
  ]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry-byebug", "~> 3.9"
  spec.add_development_dependency 'minitest-power_assert', '~> 0.3'
  spec.add_development_dependency "test_bench", '~> 1.2'
end