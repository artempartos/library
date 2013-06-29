require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Library
  class Application < Rails::Application
    config.i18n.default_locale = :ru

    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true

    config.assets.version = '1.0'
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.generators do |g|
      g.template_engine :haml
      g.stylesheets false
      g.javascripts false
    end
  end
end
