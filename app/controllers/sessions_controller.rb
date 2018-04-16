class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login], raise: false

    def me
        render json: current_user, status: :created
    end

    def login
        user = User.authenticate(user_params[:email], user_params[:password])

        render json: user, status: :ok
    end

    def update
      @user = current_user

      if @user.update(update_user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.permit(:email, :password)
      end

      def update_user_params
        params.permit(:profile_image_file)
      end
end
