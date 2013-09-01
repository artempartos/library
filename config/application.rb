require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

load 'config/configus.rb'

module Library
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.generators do |g|
      g.template_engine :haml
      g.stylesheets = false
      g.javascripts = false
      g.helper false
    end

    config.exceptions_app = self.routes
  end
end