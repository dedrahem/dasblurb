require 'csv'
require 'faker'

class UsersController < ApplicationController
  #undefined method for loggin in user  ??? 
  #before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

    def index
      @users = User.all
      @posts = Post.all
      @follows = Follow.all
    end

    def list
      @users = fetch_users

      if params[:search_text].present?
        @users = @users.select do |user|
          user.user_name.downcase.include? params[:search_text].downcase
        end
      end
    end

    def view
      @user = fetch_user.find{|user| user.id == params[:id].to_i }
    end

    def fetch_users
      id = 1
      users = []
      CSV.foreach("users.csv", headers: true) do |row|
        user_hash = row.to_hash

        user = User.new
        user.id = id
        user.user_name = user_hash["User Name"]
        user.email = user_hash["Email"]
        user.password_digest = user_hash["User Password"]
        user.created_at = user_hash["created at"]
        user.updated_at = user_hash["updated at"]
        users << user
        id += 1
      end

      # sort bu user_name
      users = users.sort {|x| x.user_name }

    end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def user_params
      params.require(:user).permit(:user_name, :email, :password)
    end
  # create new users with STRONG PARAMETERS

  def edit
  end

  def create
    @user = User.new params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
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
