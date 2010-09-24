require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require 'active_record'

NAME = "custom_error_message"
AUTHOR = ["David Easley", "Jeremy Durham"]
EMAIL = "jeremydurham@gmail.com"
HOMEPAGE = "http://github.com/jeremydurham/custom-err-msg"
SUMMARY = "Custom Error Message plugin for Rails"
DESCRIPTION = "This plugin gives you the option to not have your custom validation error message prefixed with the attribute name"


# Used by release task
GEM_NAME            = NAME
PROJECT_URL         = HOMEPAGE
PROJECT_SUMMARY     = SUMMARY
PROJECT_DESCRIPTION = SUMMARY

PKG_BUILD    = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
GEM_VERSION  = '1.1.0.pre'
RELEASE_NAME = "REL #{GEM_VERSION}"
#
# ==== Gemspec and installation
#

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = '1.1.0.pre'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{lib,spec}/**/*")  
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:clean, :package] do
  sh %{sudo gem install pkg/#{NAME}-#{Seed::VERSION} --no-update-sources}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Run coverage suite"
task :rcov do
  require 'fileutils'
  FileUtils.rm_rf("coverage") if File.directory?("coverage")
  FileUtils.mkdir("coverage")
  path = File.expand_path(Dir.pwd)
  files = Dir["spec/**/*_spec.rb"]
  files.each do |spec|
    puts "Getting coverage for #{File.expand_path(spec)}"
    command = %{rcov #{File.expand_path(spec)} --aggregate #{path}/coverage/data.data}
    command += " --no-html" unless spec == files.last
    `#{command} 2>&1`
  end
end

file_list = FileList['spec/**/*_spec.rb']

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = file_list
end

namespace :spec do
  desc "Run all examples with RCov"
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = file_list
    t.rcov = true
    t.rcov_dir = "doc/coverage"
    t.rcov_opts = ['--exclude', 'spec']
  end  
end

desc 'Default: run unit tests.'
task :default => 'spec'