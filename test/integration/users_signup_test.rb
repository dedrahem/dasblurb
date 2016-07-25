require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  puts "$>> EXECUTE  :command k / bundle exec rake test "
  puts " "
  puts "$>> Starting : test/integration/users_signup_test"
  puts "             : Read about fixtures at, "
  puts "               http://api.rubyonrails.org/classes/ActiveRecord/Fixtures.html "
  puts " "
  puts " "
  puts " * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts " "
  puts " BEGIN : class UsersSignupTest < ActionDispatch::IntegrationTest"
  puts " "
  puts " * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts " "
  test "Test for valid signup and valid sign up information" do
    puts " "
    get sign_up_path
    puts " INVALID TEST sign_up at line 13 get sign_up_path "
    puts " "
    puts " The User.count before INVALID block is : #{User.count} "
    puts " "
    assert_no_difference 'User.count' do
      post users_path, user:{ user_name: "",
                              email: "user@invalid",
                              password:  "boo",
                              password_confirmation: "foo" }
        end
      puts " INVALID TEST: count after INVALID block is  : #{User.count}"
      assert_template 'users/new'
      puts " "
      puts " INVALID TEST: assert_template 'users/new' tests that failed submit re-renders users#new"
      puts " "
      assert_select 'div#error_explanation'
      assert_select 'div.field_with_errors'
      puts " "
      puts " INVALID TEST: assert_template users/new at line 24 is: #{assert_template 'users/new'}"
      puts " "
      puts " END INVALID TEST for sign_up, END statement line 33 "
      puts " "
    end



  test "Is the signup information VALID? " do
    puts " "
    puts " "
    puts " BEGIN TEST : is the sign_up information VALID?!"
    puts " "
    puts " "
    get sign_up_path
    puts " "
    puts "The User.count before VALID block is : #{User.count}"
    puts " "
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user:  {user_name: "mary gingles",
                                            email: "mary@gingles.com",
                                            password:  "mypword",
                                            password_confirmation: "mypword" }
      end
    puts " "
    puts " The User.count after VALID block is  : #{User.count}"
    puts " "
    puts " assert_template 'sessions/new starts now!  What does it do ?!"
    puts "    It tests that a VALID ! submit will goto localhost:3000/sign_in "
    puts "       which is a new session, and that the RENDER will then be the user sign_in."
    puts " "
    assert_template 'sessions/new'
    assert_not_empty flash
    puts " "
    puts " VALID TEST : assert_template sessions/new at line 71 is:  #{assert_template 'sessions/new'} "
    puts " "
    puts " VALID TEST :  assert_not_empty flash at line 73 is:  #{assert_not_empty flash}  : TRUE if EMPTY "
    puts " "
    puts " TEST: IS THE SIGN UP VALID - END   L75"
    end
  puts "  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  puts " "
  puts " END : class UsersSignupTest < ActionDispatch::IntegrationTest "
  puts " "
  puts "  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
end  # END CLASS
