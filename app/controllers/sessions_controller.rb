class SessionsController < ApplicationController
  def new
  end

  puts "         ****** YOU ARE HERE   ******    "
  puts "              SessionsController         "
  puts "          VOID between the def new end   "
  puts "        method and the def create method "
  puts " "

  def create
    puts "                              "
    puts " Execution is in Sessions Controller create at line 13 "
    puts "                             "
    puts " email = params[:email]  "
    puts " password = params[:password]"
    email = params[:email].downcase
    password = params[:password]
    puts "                             "
    user = User.find_by email: email
    puts "Info: #{email} | #{password}"
    puts "Has User: #{user.present?}"
    # puts "Correct Password: #{user.authenticate(password)}"
    puts " Sessions controller at line 24 "
    if user && user.authenticate(password)
      session[:user_id] = user.id
      # log_in user (not using the helper)
      redirect_to timeline_path
      puts "SessionsController : session[:user_id] = user.id "
      puts " This places the user's ID in the temporary session.  See sessions_controll.rb"
    else
      puts "Sessions controller failed the user && user.auth password, therefore-render:new"
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
      puts " Session controller - render:new and END if"
      puts " if user fails user authenticate, then go to "
      puts " the views/sessions/new.html.erb and render the new user form "
      puts " sessions controller line 38 "
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
    puts "*   sessions_controller destroy method  *"
    puts "*   log_out and redirect to root path   *"
    log_out
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
