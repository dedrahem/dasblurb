class SessionsController < ApplicationController
  def new
  end

  puts " "
  puts "_________this exists in the SESSIONS CONTROLLER"
  puts "_________situated in the VOID between the def new end "
  puts "_________method and the def create method"
  puts " "
  puts " ***** A session? what is a session? A session is a Semi-permanent        ***** "
  puts " ***** connection between two computers, i.e. a client computer user      ***** "
  puts " ***** running Firefox or Safari and a server executing a RAILS app       ***** "
  puts " ***** HTTP and URL treat each request as an independent                  ***** "
  puts " ***** transaction or interface.  Information is not passed from page     ***** "
  puts " ***** to page and will not REMEMBER from previous pages.  RAILS uses the ***** "
  puts " ***** method of session to make to make temporary sessions that expire   ***** "
  puts " ***** upon browser close.  Long lived sessions use the RAILS method      ***** "
  puts " ***** of COOKIES.  This lesson does not use COOKIES.  mmm cookies        ***** "
  puts " "
  puts " NOTE : SESSIONS IS NOT AN ACTIVE RECORD OBJECT, and consequently lacks"
  puts "         some of the features provided by ACTIVE RECORD.               "
  puts " "
  puts " Exp. A user will sign_up in order to access or sign_in to the SESSION "
  puts " Exp. There is NO Session Model, therefore no @user variable analogy   "
  puts " hmmmmmmmm.     "
  puts "  "
  def create
    # get the User, validate the Pword, set the session #
    #  and redirect #
    puts " Execution is now in the Sessions Controller at line 8 "
    puts "                             "
    email = params[:email]
    password = params[:password]

    user = User.find_by email: email
    puts "Info: #{email} | #{password}"
    puts "Has User: #{user.present?}"
    # puts "Correct Password: #{user.authenticate(password)}"
    puts " Sessions controller at line 33"
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to timeline_path
      puts "Sessions Controller if user && user.authenticate(password)"
      puts " Set the session id and redirect to timeline_path"
    else
      puts "Sessions controller failed the user && user.auth password, therefore - render:new"
      render :new
      puts " Session controller - render:new END"
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end

end
