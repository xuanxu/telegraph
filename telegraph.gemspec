# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name = 'telegraph'
  gem.version = "1.0"
  gem.date = Time.now.strftime('%Y-%m-%d')
  
  gem.summary = "Morse code in ruby" 
  gem.description = ""
  
  gem.authors = ['Juanjo Bazán']
  gem.email = "jjbazan@gmail.com"
  gem.homepage = 'http://github.com/xuanxu/telegraph'
  
  gem.has_rdoc = true
  gem.rdoc_options = ['--main', 'README.rdoc', '--charset=UTF-8']
  
  gem.files = %w(MIT-LICENSE.txt README.rdoc) + Dir.glob("{spec,lib/**/*}") & `git ls-files -z`.split("\0")
  gem.require_paths = ["lib"]
  gem.add_development_dependency("rspec")
end