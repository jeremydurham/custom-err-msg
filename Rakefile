require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'rake/rdoctask'
require 'spec/rake/spectask'

NAME = "custom_error_message"
AUTHOR = ["David Easley", "Jeremy Durham"]
EMAIL = "jeremydurham@gmail.com"
HOMEPAGE = "http://github.com/jeremydurham/custom-err-msg"
SUMMARY = "Custom Error Message plugin for Rails"
DESCRIPTION = "This plugin gives you the option to not have your custom validation error message
prefixed with the attribute name"

GEM_NAME = NAME
#
# ==== Gemspec and installation
#

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = DESCRIPTION
  s.authors = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.require_path = 'lib'
  s.files = ['init.rb', 'lib/custom_error_message.rb']
  
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:clean, :package] do
  sh %{sudo gem install pkg/#{NAME} --no-update-sources}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end