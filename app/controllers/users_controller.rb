class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation)
    if @user.save
      # sign in
      session[:user_id] = @user.id
      # redirect
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
