# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{custom_error_message}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Easley", "Jeremy Durham"]
  s.date = %q{2009-12-12}
  s.description = %q{This plugin gives you the option to not have your custom validation error message
prefixed with the attribute name}
  s.email = %q{jeremydurham@gmail.com}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["init.rb", "lib/custom_error_message.rb", "README", "MIT-LICENSE"]
  s.homepage = %q{http://github.com/jeremydurham/custom-err-msg}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Custom Error Message plugin for Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
