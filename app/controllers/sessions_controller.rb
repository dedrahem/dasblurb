class SessionsController < ApplicationController
  def new
  end

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
    puts " Sessions controller at line 20."
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
