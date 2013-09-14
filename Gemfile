if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '>= 4.0.0'
gem 'pg'
gem 'puma'
gem 'draper'
gem 'carrierwave'
gem 'mini_magick'
gem 'cocoon'

gem 'twitter-bootstrap-rails'

gem 'active_model_serializers'

gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml-rails'
gem 'less-rails'
gem 'chosen-rails'
gem 'compass-rails', github: 'milgner/compass-rails', branch: 'rails4'
gem 'js-routes'
gem 'whenever'
gem 'backup'
gem 'redcarpet'
gem 'wrong'
gem 'configus'
gem 'russian'
gem 'validates'
gem 'state_machine'
gem 'term-ansicolor'
gem 'virtus'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'simple_form', github: "plataformatec/simple_form"
gem 'rails_12factor'
gem 'usefull_scopes', git: 'https://github.com/kaize/usefull_scopes.git'
gem 'validates'
gem 'authority'
gem 'ransack'
gem 'kaminari'
gem 'enumerize'
gem 'carrierwave'
gem 'mini_magick'

group :test do
  gem 'rake'
  gem 'minitest'
  gem 'simplecov'
  gem 'coveralls', require: false
  gem 'ci_reporter'
end

group :development do
  gem 'pry-rails'
  gem 'taps'
  gem 'pre-commit'
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
  gem 'cape'
end

group :test, :development do
  gem 'sqlite3'
  gem 'factory_girl_rails'
end

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end
