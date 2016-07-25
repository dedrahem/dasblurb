class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

 before_action do
  puts " "
  puts "              CONTROLLER : You are in the Application Controller ! before action do"
  puts "              prior to assignment of @current_user = User.find_by id: session[:user_id]"
  puts "              verify @current_user is : #{@current_user.inspect}"
  puts " "
  @current_user = User.find_by id: session[:user_id]
  puts " "
  puts "              AFTER assingment of @current_user = User.find_by id: session[:user_id]"
  puts "              verify @current_user is : #{@current_user.inspect}"
  puts " "
 end

 def authenticate_user!
   puts "  "
   puts "            Execution is in : Application Controller at def authenticate_user! method"
   puts "            {@current_user.inspect} is :  #{@current_user.inspect}"
   puts "            IF @CURRENT_USER.BLANK? then redirect_to sign_in_path"
   puts " "
   if @current_user.blank?
     puts "          @current_user.BLANK? is:  #{@current_user.blank?} : will redirect_to sign_in_path"
     redirect_to sign_in_path
   end
   puts "            END of def authenticate_user! in the application controller"
   puts "            {@current_user.inspect} is :  #{@current_user.inspect}"
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
