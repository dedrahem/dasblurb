require 'csv'
require 'faker'
#  @user = User.new(params[:user])    is the equivalent of                #
# this creates model attributes for a new user based on User attributes   #
#  @user = User.new(user_name: "Genghis Kahn", email: "kahn@mongol.net",  #
# password: "12345678", password_confirmation: "12345678")                #
# require users to be logged in , define method of logged_in_user
# invoke the method using , before_action :logged_in_user
# when, , only: [:edit, :update]   see method below where
# only:  is used to pass an :only options hash via only: [:edit, :update]
# before filters apply to every action in a controller, therefore-render
# we restrict this filter to only act on #edit and #update #index
# bassically must be logged in to index edit update and destroy
# Fascinating captain, simply fascinating.
# The correct user is the current user - see lines about 175 for method   #
# admin_user is def'd below

# ATTN: see sessions helper for store_ location and see before filter below #
#  , logged in user moved to appl  see notes below                          #
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,   only: :destroy
puts " "
puts "execution at: class UsersController < ApplicationController "
puts " "
    def index
      puts " "
      puts " status: users controller # index begin"
      # @users = User.all
      @users = User.paginate(page: params[:page])
      @posts = Post.paginate(page: params[:page])
      @follows = Follow.all
      puts " status: users controller # index end"
      puts " "
    end

    # see index view for will paginate -
    # will_paginate inside the users view looks for
    # an @users object, above paginate takes a hash
    # argument, and the key is :page, the parameter for the actual
    # page to generate comes from will_paginate, and the PARAMETERS
    # is defined by params[:page], whew.

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
    # -----  as paginate inherently works with users here ----- #
    # -----  the instance variable @post enables posts pa ----- #

  def show
    @user = User.find_by id: params[:id]
    @posts = @user.posts.paginate(page: params[:page])
    puts " "
    puts "Status:  Users Controller show method for @user and @posts"
  end

# what does the above do ?  @user = User.find_by id: params[:id] #
# use the find method on the User                           #
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

  # create new users with STRONG PARAMETERS * * * * * * * * * * * * * #
  def user_params
      #  params.require(:user).permit(:user_name, :email, :password)  #
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
  # create new users with STRONG PARAMETERS  * * * * * * * * * * * * * #

  def edit
    puts " Status: users controller,  def edit method "
    # @user = User.find_by id: params[:id] superceded by
    # before action and confirm the correct user
    # @user = User.find(params[:id])
  end # end def edit

#    CREATE NEW USER  #
  def create
    @user = User.new(user_params)  # there is a private method below, but i'm already calling the def above #
    if @user.save
      # the save was successful new user signed up  #
      log_in @user
      session[:user_id] = @user.id
      # redirect to the root_path via the session sign in  #
      flash[:success] = "Success: Welcome To dasBlurb"
      puts " Status : users_controller CREATE session[:user_id] = @user.id"
      puts " flash[:success] = Success: Welcome To dasBlurb "
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
    # @user = User.find_by id: params[:id] is superceded by before action
    # before action's confirm the correct user
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      puts " users_ controller: def update user attributes."
      flash[:success]="Profile is updated"
      redirect_to @user
    else
      puts " users_controller: def update fails : returns false"
      render 'edit'
    end # end if
  end # end def update

  def destroy
    User.find(params[:id]).destroy # this is known as method chaining FIND and DESTROY #
    flash[:success] = "User Deleted"
    redirect_to get_users_path
  end
  # destroy action may be limited to the admin by using a before filter above


  #                           Before filters        #

  # Confirms a logged-in user MOVED TO APPLICATION CONTROLLER  !!!!!!!! #
  # def logged_in_user
  #   unless logged_in?
  #    flash[:danger]="Please Log-In As User"
  #    redirect_to sign_in_path
  #  end # if successful you are logged in, end unless
  # end # end def
    # redirect users attempting to edit another user's
    # profile, use with a before filter above.  this before
    # filter defines the @user variable, thus making the variable
    # redundant in use above, see edit and update actions.
    # see sessions_helper.rb for method, current_user?(@user)
    #
    #     *****     Confirms the correct user     *****     #
    # THE CORRECT USER IS THE CURRENT USER - if not corrct user #
    # you will get redirected to the root_path                  #
  def correct_user
    puts "Confirm the correct user, in "
    puts "users_controller: def correct_user "
    puts "with redirect to root url unless current user"
    # @user = User.find(params[:id]) these the same lines
    @user = User.find_by id: params[:id]
    redirect_to(root_path) unless current_user?(@user)
    # redirect_to(root_url) unless current_user?(@user)
    # redirect_to(root_url) unless @user == current_user
    # what is root_url? root_path is the ?? dashboard ?
  end

  #                       PRIVATE                   #
  private
  #  def user_params
  #  @user = User.new params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  # end
  # Confirms an Admin User method
    def admin_user
      puts "user status: if the current user is not admin redirect to root"
      redirect_to (root_path) unless current_user.admin?
    end

end # end User Class
