ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #  log_in(user) is borrowed from the sessions helper, HERE it is called !!!!
  #  sign_in(user)  because i didn't know if there would be a name conflict even though
  #  this method is placed in the test_helper and not the sessions helper

  #  sign_in(user) replaces log_in_as(user) which i could not get to work - why ?? operator error
  #  log_in(user) like log_in_as(user) is called from ,
  #   following_test.rb in the integrations test

  def sign_in(user)
    puts " "
    puts "$$>             test/test_helper.rb : executing def sign_in(user)"
    puts "$$>             user.inspect the argument(user) returns:  #{user.inspect}  "
    puts "$$>             verify the user.id is :  #{user.id}"
    puts "$$>             Now set :  session[:user_id] = user.id "
    puts " "
    session[:user_id] = user.id
  end


  #  LOG IN A TEST USER used primarily in test/integration/following_test.rb #
  def log_in_as(user)
    puts " "
    puts "$$>             test/test_helper.rb : executing def log_in_as(user)"
    puts "$$>             user.inspect the argument(user) returns:  #{user.inspect}  "
    puts " "
    puts "$$>     Will now attempt to POST to sign_in_path to create a session using this, "
    puts "$$>     post sign_in_path, session: {email: user.email, password: user.password} "
    puts "$$>     GO TO post sign_in_path NOW"
    post sign_in_path, session: {email: user.email, password: user.password}
  end
end
