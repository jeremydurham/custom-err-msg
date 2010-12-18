require 'rubygems'
require 'active_record'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'rake/rdoctask'
require 'rspec/core/rake_task'

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
end

namespace :spec do
  desc "Run all examples with RCov"
  RSpec::Core::RakeTask.new(:rcov) do |t|
    t.rcov = true
  end
end

desc 'Default: run unit tests.'
task :default => 'spec'