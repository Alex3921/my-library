require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MyLibrary
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

  end
end
