$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "md_template_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "md_template_handler"
  s.version     = MdTemplateHandler::VERSION
  s.authors     = ["James Hood-Smith"]
  s.email       = ["james@hood-smith.co.uk"]
  s.homepage    = "https://github.com/jhoodsmith/md_template_handler"
  s.summary     = "Markdown template handler."
  s.description = "A really simple Markdown template handler for Rails 5 using RedCarpet."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "redcarpet"
end
