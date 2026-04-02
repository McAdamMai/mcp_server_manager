module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        # CRITICAL: This allows Postman to register without a CSRF token
        skip_before_action :verify_authenticity_token
        
        respond_to :json
      end
    end
  end
end