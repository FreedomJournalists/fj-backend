class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:create], raise: false

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.where(id: params[:id])
    if user.update(update_user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      @user.destroy
      render json: @user, status: :destroyed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:first_name, :last_name, :nickname, :email, :password ,:profile_image_file)
    end

    def update_user_params
      params.permit(:profile_image_file, :profile_image_file_file_name, :profile_image_file_content_type, :profile_image_file_file_size, :profile_image_file_updated_at)
    end
end
