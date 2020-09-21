# -*- encoding: utf-8 -*-
# stub: bing_translator 4.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bing_translator".freeze
  s.version = "4.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ricky Elrod".freeze]
  s.date = "2016-04-22"
  s.description = "Translate strings using the Bing HTTP API. Requires that you have a Client ID and Secret. See README.md for information.".freeze
  s.email = "ricky@elrod.me".freeze
  s.homepage = "https://www.github.com/relrod/bing_translator-gem".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Translate using the Bing HTTP API".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8.0"])
      s.add_runtime_dependency(%q<savon>.freeze, ["~> 2.10.0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8.0"])
      s.add_dependency(%q<savon>.freeze, ["~> 2.10.0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8.0"])
    s.add_dependency(%q<savon>.freeze, ["~> 2.10.0"])
  end
end
