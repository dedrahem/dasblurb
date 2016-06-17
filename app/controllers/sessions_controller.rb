class SessionsController < ApplicationController
  def new
  end

  def create
    # get the User, validate the Pword, set the session #
    #  and redirect #
    puts " ............Sessions Controller Line 8 "
    puts "                             "
    email = params[:email]
    password = params[:password]

    user = User.find_by email: email
    puts "Info: #{email} | #{password}"
    puts "Has User: #{user.present?}"
    # puts "Correct Password: #{user.authenticate(password)}"
    puts " ..............LINE 20 ........................."
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
      puts "TRUE at line 21 user && user.authenticate(password)"
    else
      puts " failed the if and went to render new .........."
      render :new
      puts " end of render new "
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end

end
