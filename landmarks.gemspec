# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'landmarks/version'


# require_relative './lib/landmarks/version'

Gem::Specification.new do |spec|
  spec.name          = "landmarks-of-st-petersburg"
  spec.version       = Landmarks::VERSION
  spec.authors       = ["'Igor Eskin'"]
  spec.email         = ["'eskinhd@gmail.com'"]

  spec.summary       = %q{Top 20 architectural landmarks of St. Petersburg with descriptions and other useful information.}
  spec.description   = %q{This gem allows to scrape a website of top 20 architectural attractions of St. Petersburg, Russia,
    and by the user's choice display an eloquent description of each individual attraction as well as some useful details (if available),
    such as location, directions, names of other attractions located nearby, business hours and possible admission fee.}
  spec.homepage      = "https://github.com/igoreskin/landmarks-of-st-petersburg-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
=begin
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
=end

  spec.files         = ["lib/landmarks/cli.rb", "lib/landmarks/landmark.rb", "lib/landmarks/scraper.rb", "lib/landmarks.rb", "config/environment.rb", "bin/landmarks", "lib/landmarks/version.rb"]
  spec.bindir        = "bin"
  spec.executables   << "landmarks"
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
end
