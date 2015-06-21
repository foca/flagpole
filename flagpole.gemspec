require "./lib/flagpole/version"

Gem::Specification.new do |s|
  s.name        = "flagpole"
  s.licenses    = ["MIT"]
  s.version     = Flagpole::VERSION
  s.summary     = "Handle multiple flags in a single integer"
  s.description = "Use a bitmap to represent multiple flags (e.g. user settings)"
  s.authors     = ["Nicolas Sanguinetti"]
  s.email       = ["contacto@nicolassanguinetti.info"]
  s.homepage    = "http://github.com/foca/flagpole"

  s.files = Dir[
    "LICENSE",
    "README.md",
    "lib/flagpole.rb",
    "lib/flagpole/version.rb",
  ]

  s.add_development_dependency "cutest", "~> 1.2"
end
