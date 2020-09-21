# -*- encoding: utf-8 -*-
# stub: macaddr 1.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "macaddr".freeze
  s.version = "1.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ara T. Howard".freeze]
  s.date = "2014-04-11"
  s.description = "cross platform mac address determination for ruby".freeze
  s.email = "ara.t.howard@gmail.com".freeze
  s.homepage = "https://github.com/ahoward/macaddr".freeze
  s.licenses = ["Ruby".freeze]
  s.rubyforge_project = "codeforpeople".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "macaddr".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<systemu>.freeze, ["~> 2.6.2"])
    else
      s.add_dependency(%q<systemu>.freeze, ["~> 2.6.2"])
    end
  else
    s.add_dependency(%q<systemu>.freeze, ["~> 2.6.2"])
  end
end
