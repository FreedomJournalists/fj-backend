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

      if @user.update(update_params)
        render json: @v1_user, status: :ok
        else
        render json: @v1_user.errors, status: :unprocessable_entity
      end
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.permit(:email, :password)
      end

      def update_params
        params.permit(:profile_image_file, :profile_image_file_file_name, :profile_image_file_content_type, :profile_image_file_file_size, :profile_image_file_updated_at)
      end
end
