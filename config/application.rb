require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module XmasFair2021
  class Application < Rails::Application
    config.app                            = config_for(:config)
    config.i18n.available_locales         = %i[ro en]
    config.i18n.default_locale            = :ro
    config.time_zone                      = 'Bucharest'
    config.generators.scaffold_stylesheet = false

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Load modules from /lib/modules
    config.eager_load_paths += %W(#{config.root}/lib/modules)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
