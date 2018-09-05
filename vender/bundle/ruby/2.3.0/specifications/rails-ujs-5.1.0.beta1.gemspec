# -*- encoding: utf-8 -*-
# stub: rails-ujs 5.1.0.beta1 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-ujs".freeze
  s.version = "5.1.0.beta1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2017-02-23"
  s.description = "This gem provides rails-ujs driver for Rails applications.".freeze
  s.email = "david@loudthinking.com".freeze
  s.homepage = "https://github.com/rails/rails-ujs".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Ruby on Rails unobtrusive scripting adapter.".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
  end
end
