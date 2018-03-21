class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login], raise: false

    def me
        render json: current_user, status: :created
    end

    def login
        user = User.authenticate(user_params[:email], user_params[:password])

        render json: user, status: :ok
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.permit(:email, :password)
      end
end
