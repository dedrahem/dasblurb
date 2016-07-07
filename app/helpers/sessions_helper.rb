module SessionsHelper
  #  LOOK ! - this helper contains friendly forwarding methods #
  #  scroll down for notes and the actual methods -
  #  also see the application controller and the users controller
  def log_in(user)
    session[:user_id] = user.id
  end

# session[:user_id] = user.id, this line is already found in the
# sessions controller at line 48, ?  because the alt method
# is to put log_in user at that spot which would call this one line method

# returns true if the given user IS the current user
  def current_user?(user)
    user == current_user
  end

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

#  ### Redirects back to the stored location OR to the default  #### #
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
#  ### Redirects back to the stored location OR to the default  #### #

#  <<<<<<<   STORE THE URL THAT IS ATTEMPTING TO BE ACCESSED   >>>>>>  #
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
# the method puts the REQUESTED URL request.url into the session hash #
# variable under the key of :forwarding_url but only in the event     #
# of accessing as a GET request...                                    #
#  this must be added to the logged_in_user before filter in the      #
# users controller.

#  <<<<<<<   STORE THE URL THAT IS ATTEMPTING TO BE ACCESSED   >>>>>>  #







end # end of module SessionsHelper
