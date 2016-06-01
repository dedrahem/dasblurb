class SessionsController < ApplicationController
  def new
  end

  def create
    # get the User, validate the Pword, set the session #
    #  and redirect #

    email = params[:email]
    password = params[:password]

    user = User.find_by email: email
    puts "Info: #{email} | #{password}"
    puts "Has User: #{user.present?}"
    puts "Correct Password: #{user.authenticate(password)}"

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end

end
