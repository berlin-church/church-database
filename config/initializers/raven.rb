# frozen_string_literal: true
# Raven.configure do |config|
#   if Rails.env.production?
#     #config.dsn = ENV['SENTRY']
#     config.environments = ['production']
#     config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
#   end
# end

# Raven.configure do |config|
#   logger = ::Raven::Logger.new(STDOUT)
#   logger.level = "error"
#   config.logger = logger
# end

Raven.configure do |config|
  config.dsn = "foo" unless Rails.env.development?
end
