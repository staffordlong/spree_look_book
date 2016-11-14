# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_look_book'
  s.version     = '3.1.1'
  s.summary     = 'Spree Look Book for creating a look from a group of different products.'
  s.description = 'A lookbook can be described as "fashion diaries" because fashion bloggers are constantly updating them on a daily or weekly basis. This gives customers/viewers ideas on how to style outfits, or to show what the latest fashions are. Lookbooks can be created from admin interface by adding a group of different products(For example: A shirt, pants, shoes, and so on..), with images.'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'Andrew Scott'
  s.email     = 'amscott@openmailbox.org'
  s.homepage  = 'https://github.com/askl56'
  s.license = 'BSD-3'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.1.1'  
  s.add_runtime_dependency 'spree_backend', '3.1.1'


  s.add_development_dependency 'capybara', '~> 2.6'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'
  s.add_development_dependency 'poltergeist', '~> 1.6.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
