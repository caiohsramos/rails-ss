# frozen_string_literal: true

Rails.application.config.to_prepare do
  Authorization.setup do |config|
    config.username = ENV.fetch('AUTH_USERNAME', 'admin')
    config.password = ENV.fetch('AUTH_PASSWORD', 'password')
  end
end
