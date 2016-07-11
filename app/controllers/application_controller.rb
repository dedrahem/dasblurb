class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

 before_action do
  @current_user = User.find_by id: session[:user_id]
 end

 def authenticate_user!
   puts "  "
   puts "$$$ Status: application controller in def authenticate_user! method        *"
   puts "$$$         IF @CURRENT_USER.BLANK? then redirect_to sign_in_path          *"
   puts "$$$ Status: application controller, {@current_user.inspect} is :  #{@current_user.inspect}"
   puts " "
   if @current_user.blank?
     puts "  !! application controller : @current_user IS BLANK, will now redirect to sign in path."
    redirect_to sign_in_path
   end
   puts " END of def authenticate_user! in the application controller"
   puts " "
 end

private
  # this method was moved from the users controller, user controller    #
  # still contains the before filter call for logged_in_user            #
  # this method needed by the Users controller AND the Posts controller #
  # So we place the METHOD in this, the Application controller it being #
  # the base class the progenitor of all controllers                    #
 def logged_in_user
   unless logged_in?
     puts " "
     puts " Status: def logged_in_user via Application Controller    >"
     puts " Status: method is called by users and posts controllers  >"
     puts " "
     # store_location  taking this out until later ---------------------#
     flash[:danger]="Please Log-In As User"
     redirect_to sign_in_path
   end # if successful you are logged in, end unless
 end # end def

end
# RAILS has a sessions method, who knew.  #
# treat sessions as if it were a hash and assign #
# to it as  session[:user_id] = user.id in sessions controller line 48 #
# He, puts this session line in the sessions_helper.rb  ##
#  what is the difference  #
