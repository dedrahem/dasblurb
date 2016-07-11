class SessionsController < ApplicationController
  def new
  end
  puts "   i can put my pants on all by myself.         *"
  puts "                                                *"
  puts "                            "
  puts "       STARTED Sessions Controller              *"
  puts "       def new in sessions controller           *"
  puts "                                                *"

  def create
    puts "                              "
    puts "Status: Sessions_Controller#create at line 13 "
    puts "                             "
    puts "setting : email = params[:email]  "
    puts "setting : password = params[:password]"
    email = params[:email].downcase
    password = params[:password]
    puts "                             "
    user = User.find_by email: email
    puts " setting session: user = User.find_by email: email"
    #   puts "Info: #{email} | #{password}" ####
    puts "Has User?, is user present is : #{user.present?}"
    # puts "Correct Password: #{user.authenticate(password)}"
    puts " "
    puts "Status: beginning user and user.authenticate "
    puts " "
    if user && user.authenticate(password)
      puts " "
      puts "The session user is user.inspect :   #{user.inspect}"
      puts " "
      session[:user_id] = user.id
      puts "Assigning the session id using: session[:user_id] = user.id"
      puts "This places the user's ID in the temporary session."
      # log_in user (this is for the helper NOT USING HELPER)
      # redirect_to timeline_path  blanked this and put in below redirect
      puts " "
      puts "$$$$$   : You are still in sessions#create: "
      puts "$$$$$$  : Will now execute, redirect_to timeline_path"
      puts " "
      # removed this sunday 3rd it directs to the user show page - redirect_back_or(user)
      redirect_to timeline_path
      puts " "
      puts "$$$$ You are in sessions#create: immediately after the redirect_to timeline_path"
      puts "     having now returned from the redirect, and will now end the authenticate process."
      puts "  "
    else
      puts "sessions#create: failed the user && user.auth password, therefore-render:new"
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
      puts " sessions#create: - render:new and END if"
      puts "      if user fails user authenticate, then go to "
      puts "           the views/sessions/new.html.erb and render the new user form "
      puts "  "
    end
  end

  # def delete
  #  session.delete :user_id
  #  redirect_to root_path
  # end
    #  REF the view >  layouts/_header.html.erb
    # contains the log out link of
    # <#= link_to "Log Out", sign_out_path, method: "delete" #>
  def destroy
    puts " "
    puts "Status: sessions_controller, destroy method "
    puts ""
    log_out if logged_in?
    redirect_to root_path
  end





end

# With the use of the session method, and session is a method
# defined by RAILS.  We can treat session as if it were a hash
# and assign to it like this,
# session[:user_id] = user.id
# which may also be found in a sessions helper def for sign_in
# this serves to place a temporary version of the user's id
# inside the users's browser for accessing other pages.  Which is
# accomplished by defining a current_user method to find the user
# in the database that matches the session ID of the client user. !!
# here that would be, current_user.user_name , (354) or untimately
#
# @current_user = User.find_by(id: session[:user_id])
#
# find the user with an id, an id that matches the session id    !!
#
# puts " ***** A session? what is a session? A session is a Semi-permanent        ***** "
# puts " ***** connection between two computers, i.e. a client computer user      ***** "
# puts " ***** running Firefox or Safari and a server executing a RAILS app       ***** "
# puts " ***** HTTP and URL treat each request as an independent                  ***** "
# puts " ***** transaction or interface.  Information is not passed from page     ***** "
# puts " ***** to page and will not REMEMBER from previous pages.  RAILS uses the ***** "
# puts " ***** method of session to make to make temporary sessions that expire   ***** "
# puts " ***** upon browser close.  Long lived sessions use the RAILS method      ***** "
# puts " ***** of COOKIES.  This lesson does not use COOKIES.  mmm cookies        ***** "
# puts " "
# puts "  SESSIONS IS NOT AN ACTIVE RECORD OBJECT, and consequently lacks"
# puts "         some of the features provided by ACTIVE RECORD.               "
# puts " "
# puts " Exp. A user will sign_up in order to access or sign_in to the SESSION "
# puts " Exp. There is NO Session Model, therefore no @user variable analogy   "
# puts " See sessions/new.html for params hash info    "
# puts "  "
# get the User, validate the Pword, set the session - alt method 1 #
# user = User.find_by(email: params[:session][:email].downcase)
# if user && user.authenticate(params[:session][:password])
# and redirect #
# User.find_by method is a provision of Active Record see console cmnds #
# authenticate method is provided by has_secure_password #
