# frozen_string_literal: true

Devise.setup do |config|
  # ==========================================
  # Standard Devise Defaults
  # ==========================================
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # ==========================================
  # === JWT Configuration for Phase 2 API ===
  # ==========================================
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.secret_key_base
    
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/login$}]
    ]
    
    jwt.revocation_requests = [
      ['DELETE', %r{^/api/v1/logout$}]
    ]
    
    jwt.expiration_time = 1.day.to_i
  end
  
  # Tell Devise to respond to BOTH HTML (Browser) and JSON (API)
  config.navigational_formats = ['*/*', :html, :json]
end