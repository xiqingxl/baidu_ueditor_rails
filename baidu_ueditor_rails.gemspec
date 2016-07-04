$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "baidu_ueditor_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "baidu_ueditor_rails"
  s.version     = "0.2.1"
  s.authors     = ["chuanpin zhu"]
  s.email       = ["zcppku@gmail.com"]
  s.homepage    = "https://github.com/zcpdog/baidu_ueditor_rails"
  s.summary     = "Baidu ueditor for rails."
  s.description = "ueditor for rails 3 and rails 4, it is a good wysiwyg html editor"

  s.files = Dir["{app,lib,vendor,bin}/**/*", "MIT-LICENSE", "Rakefile", "README.md","Gemfile","Gemfile.lock"]
  s.test_files  = Dir["test/**/*"]
  s.license     = 'MIT'
end
