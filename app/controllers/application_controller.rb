class ApplicationController < ActionController::Base
  # Prevent Devise from redirecting to HTML login page for API requests
  before_action :authenticate_user!, unless: :json_request?

  private

  def json_request?
    request.format.json? || request.path.start_with?('/api/')
  end
end