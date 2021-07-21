require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Syspurchase
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.assets            false
      g.system_tests      false
      g.test_framework    nil
      g.jbuilder          false
      g.factory_bot       false
    end

  end
end
