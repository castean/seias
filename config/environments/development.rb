Seias::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  # Paperclip.options[:command_path] = "/usr/local/bin/convert"
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_deliveries = true
  #config.action_mailer.default_options = {from: 'seias@difchihuahua.gob.mx'}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address              => "salida2.uach.mx",
      :port                 => 25,
      :domain               => 'uach.mx',
      :user_name            => 'uniq',
      :password             => 'cgtisei',
      :authentication       => 'plain',
      :enable_starttls_auto => false
  }

  # Enable threaded mode
  # config.threadsafe!
  config.middleware.use ExceptionNotifier,
                        :email_prefix => "SIDIF DEVELOPTMENT Error",
                        :sender_address => %{"Sistema Integral DIF Estatal" <sistema.integral@difchihuahua.gob.mx>},
                        :exception_recipients => %w{dif.creyes@gmail.com}

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.ldap_auth = true

  config.authorization_method = :ldap #One of :password, :ldap, etc
end
