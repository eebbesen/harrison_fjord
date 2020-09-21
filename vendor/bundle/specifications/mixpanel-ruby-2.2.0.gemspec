# -*- encoding: utf-8 -*-
# stub: mixpanel-ruby 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mixpanel-ruby".freeze
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mixpanel".freeze]
  s.date = "2015-07-13"
  s.description = "The official Mixpanel tracking library for ruby".freeze
  s.email = "support@mixpanel.com".freeze
  s.homepage = "https://mixpanel.com/help/reference/ruby".freeze
  s.licenses = ["Apache License 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Official Mixpanel tracking library for ruby".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.18"])
    else
      s.add_dependency(%q<activesupport>.freeze, ["~> 4.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.18"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, ["~> 4.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.18"])
  end
end
