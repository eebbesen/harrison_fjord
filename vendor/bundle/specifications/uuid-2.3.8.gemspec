# -*- encoding: utf-8 -*-
# stub: uuid 2.3.8 ruby lib

Gem::Specification.new do |s|
  s.name = "uuid".freeze
  s.version = "2.3.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Assaf Arkin".freeze, "Eric Hodel".freeze]
  s.date = "2015-06-03"
  s.description = "UUID generator for producing universally unique identifiers based on RFC 4122\n(http://www.ietf.org/rfc/rfc4122.txt).\n".freeze
  s.email = "assaf@labnotes.org".freeze
  s.executables = ["uuid".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze, "MIT-LICENSE".freeze]
  s.files = ["MIT-LICENSE".freeze, "README.rdoc".freeze, "bin/uuid".freeze]
  s.homepage = "http://github.com/assaf/uuid".freeze
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze, "--title".freeze, "UUID generator".freeze, "--line-numbers".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "UUID generator".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<macaddr>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<macaddr>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<macaddr>.freeze, ["~> 1.0"])
  end
end
