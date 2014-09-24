class UsersController < ApplicationController

before_filter :authorize, only: [:index]
def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to root_url, notice: "Thank you for signing up!"
  else
    render "new"
  end
end

def index
  @users = User.all
end

private
def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
end
end
