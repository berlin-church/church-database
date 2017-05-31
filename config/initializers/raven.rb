# frozen_string_literal: true
Raven.configure do |config|
  if Rails.env.production?
    config.dsn = ENV['SENTRY']
    config.environments = ['production']
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  end
end
