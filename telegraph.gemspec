# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name = 'telegraph'
  gem.version = "1.0.3"
  gem.date = Time.now.strftime('%Y-%m-%d')

  gem.summary = "Ruby gem to read and write Morse code"
  gem.description = "Morse code translation. Telegraph provides a simple text-to-morse, morse-to-text translator."

  gem.authors = ['Juanjo Bazán']
  gem.email = "jjbazan@gmail.com"
  gem.homepage = 'http://github.com/xuanxu/telegraph'

  gem.rdoc_options = ['--main', 'README.rdoc', '--charset=UTF-8']

  gem.files = %w(MIT-LICENSE.txt README.rdoc) + Dir.glob("{spec,lib/**/*}") & `git ls-files -z`.split("\0")
  gem.add_development_dependency("rspec", ">=3.10.0")
end
