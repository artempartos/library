ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong/adapters/minitest'

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
end