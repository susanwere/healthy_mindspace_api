class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    @users = User.all
    render json: @users
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      @user.reload
      render json: {user: @user, token: token}
    else
      render json: {error: @user.errors.messages}, status: :unprocessable_entity
    end
  end

  def update
    if current_user
      @user.update(user_params)
      if @user.valid?
        @user.reload
        render json: {user: @user} 
      else 
        render json: { error: @user.errors.messages }
      end
    else
      render json: {error: "Sorry you can only update your profile"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}, status: :unprocessable_entity
    end
  end


  def auto_login
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: { user: {
                    id: @user.id,
                    username: @user.username, 
                    email: @user.email,
                    user_image: @user.user_image,
                    created_at: @user.created_at,
                    updated_at: @user.updated_at
                    }
                  }
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Sorry. That user does not exist"}
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation, :user_image)
  end
end
