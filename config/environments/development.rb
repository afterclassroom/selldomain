Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'gmail',
    :user_name            => 'pesomebeta@gmail.com',
    :password             => 'pesome123',
    :authentication       => 'plain',
    :enable_starttls_auto => true,
    :openssl_verify_mode  => 'none'
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  GoDaddyReseller_API = {
    live: false,
    user_id: "1002104",
    password: "12345678"
  }

  PAYPAL_API = {
    sandbox: true,
    username: "pesomebeta-facilitator_api1.gmail.com",
    password: "1404957560",
    signature: "An5ns1Kso7MWUdW4ErQKJJJ4qi4-AkbPdqM1kV216sF.eg1o1Eb2wOwB"
  }

  PAYPAL_DEVELOPER_ACCOUNT = {
    email: "pesomebeta@gmail.com",
    password: "pesome123"
  }
end
