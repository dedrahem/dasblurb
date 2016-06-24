class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

 before_action do
  @current_user = User.find_by id: session[:user_id]
 end

 def authenticate_user!
   puts " LINE 11 : application controller in def authenticate_user!  * *"
   puts " IF @CURRENT_USER.BLANK? then redirect_to sign_in_path * * * * *"
   if @current_user.blank?
     puts "  !! application controller :  @current_user is blank, redirect"
    redirect_to sign_in_path
   end
 end
end
# RAILS has a sessions method, who knew.  #
# treat sessions as if it were a hash and assign #
# to it as  session[:user_id] = user.id in sessions controller line 48 #
# He, puts this session line in the sessions_helper.rb  ##
#  what is the difference  #
