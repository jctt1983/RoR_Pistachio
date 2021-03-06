require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Pistachio
  class Application < Rails::Application
    # Add Theme
    config.assets.paths += Dir["#{Rails.root}/vendor/details-wrap/*"]
    
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    
    # Enable the asset pipeline
    config.assets.enabled = true
    
    # Version of your assets, change this if you want to expire all your assets
    # config.assets.version = '1.1'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # config.assets.initialize_on_precompile = false

    # Specify the layout per Devise::Controller
    config.to_prepare do
      Devise::SessionsController.layout "signin"
      Devise::RegistrationsController.layout "signup", :only => [:new, :create]
      Devise::PasswordsController.layout "signup", :only => [:new, :create]
    end    
  end
end
