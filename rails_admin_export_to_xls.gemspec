$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_export_to_xls/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_export_to_xls"
  s.version     = RailsAdminExportToXls::VERSION
  s.authors     = ["Luu Tuan Hai"]
  s.email       = ["hai.luut@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminExportToXls."
  s.description = "TODO: Description of RailsAdminExportToXls."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.7"
end
