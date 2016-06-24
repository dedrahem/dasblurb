module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end


# session[:user_id] = user.id, this line is already found in the
# sessions controller at line 48, ?  because the alt method
# is to put log_in user at that spot which would call this one line method

  # Return the current logged in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

# a user is logged in if there is a current user in the session -
# meaning if current_user is not nil.  check for a current user.
# returns true if the user is logged in , FALSE otherwise.
  def logged_in?
    !current_user.nil?
  end

# log out the current user
  def log_out
    session.delete(:user_id)
  @current_user=nil
  end





end # end of module SessionsHelper
