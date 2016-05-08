require 'csv'
require 'faker'

class UsersController < ApplicationController

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
