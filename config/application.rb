# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Church
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.delete Rack::Lock

    config.time_zone = ENV['TIME_ZONE'] || 'Berlin'

    # config.middleware.insert_before 0, "Rack::Cors" do
    #   allow do
    #     origins 'members-local.berlin.church', 'members.berlin.church'
    #     resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options, :head]
    #   end
    # end
  end
end
