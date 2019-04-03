# frozen_string_literal: true

if ENV['SENTRY']
  Raven.configure do |config|
    if Rails.env.production?
      config.dsn = ENV['SENTRY']
      config.environments = ['production']
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end
    logger = ::Raven::Logger.new(STDOUT)
    logger.level = "error"
    config.logger = logger
  end
end
