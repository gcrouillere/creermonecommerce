require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "attachinary/orm/active_record"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ceramiquesnugier
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
    end

    # config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    #   r301      '/', 'https://www.creermonecommerce.fr/'
    #   r301      '/home', 'https://www.creermonecommerce.fr/home'
    #   r301      '/info', 'https://www.creermonecommerce.fr/info'
    #   r301      '/produits', 'https://www.creermonecommerce.fr/produits'
    #   r301      '/lessons/new', 'https://www.creermonecommerce.fr/lessons/new'
    #   r301      '/#anchor-info', 'https://www.creermonecommerce.fr/#anchor-info'
    #   r301      '/users/sign_in', 'https://www.creermonecommerce.fr/users/sign_in'
    #   r301      '/users/sign_up', 'https://www.creermonecommerce.fr/users/sign_up'
    # end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
