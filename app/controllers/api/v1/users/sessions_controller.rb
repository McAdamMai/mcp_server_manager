module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        # CRITICAL: This allows Postman to log in without a CSRF token
        skip_before_action :verify_authenticity_token
        
        respond_to :json
      end
    end
  end
end