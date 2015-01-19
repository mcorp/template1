$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'template1/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "template1"
  s.version     = Template1::VERSION
  s.authors     = ['Adilson Carvalho']
  s.email       = %w(adilson@mcorp.io)
  s.homepage    = 'https://github.com/mcorp/template1'
  s.summary     = 'Simple template and helpers'
  s.description = 'Just a simple collection of layouts and helpers to make our lives easier'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.0'
end
