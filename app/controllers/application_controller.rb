class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # Import HttpAuthentication library from ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    # Require authentication for all controllers in our app
    before_action :require_login

    # This will be called when we need auth
    def require_login
        authorize_request || render_unauthorized("Access denied")
    end

    # Helper method to find the current_user in request
    def current_user
        @current_user ||= authorize_request
    end

    # Render a message when the user in unauthorized
    def render_unauthorized(message)
        errors = { errors: [ { detail: message } ] }
        render json: errors, status: :unauthorized
    end

    private
    # Authenticate a user with token
    def authorize_request
        authenticate_with_http_token do |token, options|
            User.find_by(token: token)
        end
    end
end
