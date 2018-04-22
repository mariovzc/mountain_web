class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]
  before_action :set_user, only: [:update, :desactivate, :activate]
  before_action :get_users, only: [:create, :update]

  def index
    @users = User.all
  end
  def create
    user = User.new(user_params)  
    unless user.save
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
  
  def login
    @user = User.find_by(email: params[:email].to_s.downcase)
  
    if @user && @user.authenticate(params[:password])
        @auth_token = JsonWebToken.encode({user_id: @user.id})
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def desactivate
    if @user.active
      @user.active = false
      @user.save  
    else
      render json: {error: 'User is not active'}, status: :bad_request
    end
  end

  def activate
    unless @user.active
      @user.active = true
      @user.save
    else
      render json: {error: 'User is active'}, status: :bad_request 
    end
  end

  def get_payments
    render json: {ok: "ok"}
  end

  def payments
    render json: {ok: "ok"}
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :document, :phone)
  end

  def set_user
    @user = User.find(params[:id])
  end
  def get_users
    @users = User.all
  end
end
