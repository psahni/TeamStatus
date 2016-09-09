require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TeamStatus
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    Rails.application.config.assets.precompile += %w( report.css )
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    #config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    #config.action_mailer.delivery_method = :sendmail
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "globallogic.com",
      :user_name            => "prashantkumar.sahni@globallogic.com",
      :password             => "",
      :authentication       => 'plain'
    }
  end
end
