ENV["RAILS_ENV"] ||= "test"

if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start('rails')
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  include AuthHelper
end
