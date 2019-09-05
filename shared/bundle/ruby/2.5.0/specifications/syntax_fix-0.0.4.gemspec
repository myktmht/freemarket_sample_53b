# -*- encoding: utf-8 -*-
# stub: syntax_fix 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "syntax_fix".freeze
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergey Parizhskiy".freeze]
  s.date = "2013-11-29"
  s.description = "Replace Ruby 1.8 syntax with the Ruby 1.9 syntax all over the project".freeze
  s.email = ["parizhskiy@gmail.com".freeze]
  s.executables = ["syntax_fix".freeze]
  s.files = ["bin/syntax_fix".freeze]
  s.homepage = "https://github.com/HeeL/syntax_fix".freeze
  s.rubyforge_project = "syntax_fix".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Replace Ruby 1.8 syntax with the modern one".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
