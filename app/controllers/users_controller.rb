require 'csv'
require 'faker'
#  @user = User.new(params[:user])    is the equivalent of                #
# this creates model attributes for a new user based on User attributes   #
#  @user = User.new(user_name: "Genghis Kahn", email: "kahn@mongol.net",  #
# password: "12345678", password_confirmation: "12345678")                #


class UsersController < ApplicationController

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

    # -----                                               ----- #
    # -----                                               ----- #

  def show
    @user = User.find_by id: params[:id]
  end

# what does the above do ?  use the find method on the User #
# model, User class, to retrieve the user from the database #
# based off the model's index id, and finding id'd user,    #
# assign it to an instance variable (per user's table)      #
# the @user facilitating hand-off to the html view          #
#      @user = User.find(params[:id])
# with an index at 1, params[:id] will be user id 1         #
# this is equiv to using User.find(1) at the console        #
# params[:id] IS THE STRING, "1" and find will convert      #
# the string to an integer, ..........                      #

  def new
    @user = User.new
  end

  # create new users with STRONG PARAMETERS
  def user_params
      #  params.require(:user).permit(:user_name, :email, :password)  #
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
  # create new users with STRONG PARAMETERS

  def edit
  end

#    OKAY NOW CREATE  #
  def create
    @user = User.new(user_params)  # there is a private method below, but i'm already calling the def above #
    if @user.save
      # the save was successful new user signed up  #
      log_in @user
      session[:user_id] = @user.id
      # redirect to the root_path via the session sign in  #
      flash[:success] = "Success: Welcome To dasBlurb"
      puts " You are in the users_controller CREATE session[:user_id] = @user.id"
      puts "  flash[:success] = Success: Welcome To dasBlurb "
      puts " Now will redirect to the sign in path"
      redirect_to sign_in_path
    else
      render :new
      puts " "
      puts "users_controller CREATE:   render :new  "
      puts "users_controller CREATE:   at line 103.  IF @user.save true THEN session[id], ELSE 'render :new'  "
      puts " RENDER NEW"
      puts " "
      # render 'new'
    end # if #
  end # def create #


  def update
  end

  def destroy
  end


  # private
  #  def user_params
  #  @user = User.new params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  # end

end
