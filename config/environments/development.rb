Rails.application.configure do
  config.ember.variant = :development
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

  # MAIL
  #  config.action_mailer.perform_deliveries = true
  #  config.action_mailer.raise_delivery_errors = true
  #  config.action_mailer.delivery_method = :smtp
  #  host = 'localhost:3000'
  #  config.action_mailer.default_url_options = { host: host }
  #  ActionMailer::Base.smtp_settings = {
  #    :address        => 'smtp.sendgrid.net',
  #    :port           => '587',
  #    :authentication => :plain,
  #    :user_name      => 'ztoolson',
  #    :password       => '***',
  #    :domain         => 'heroku.com',
  #    :enable_starttls_auto => true
  #  }

  #  config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '-i -t'
  # }

  #  config.action_mailer.perform_deliveries = true
  #  config.action_mailer.delivery_method = :letter_opener
  #
  #  config.action_mailer.raise_delivery_errors = true
  #  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.smtp_settings = {
      :address => "localhost",
      :port => 25,
      :domain => "whatever.com",
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
end
