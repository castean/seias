Seias::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  # Paperclip.options[:command_path] = "/usr/bin/identify"
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false
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
                        :email_prefix => "SEIAS Error",
                        :sender_address => %{"SEIAS" <seias@difchihuahua.gob.mx>},
                        :exception_recipients => %w{rgonzalez@uach.mx rivazquez@uach.mx cfgarcia@uach.mx cdelrazo@uach.mx dif.acastellanos@gmail.com dif.creyes@gmail.com dif.ialderete@gmail.com}

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  #Extras
  config.ldap_auth = true

  config.authorization_method = :ldap #One of :password, :ldap, etc
end
