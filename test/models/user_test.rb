require "test_helper"
#  / because there is a production Vs a test database  /
#  /  fixtures or hardcode set up is hardcode......   /
#  /  def setup              /
#  /  @user = User.find(1) nope won't work......... /
class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "Mike Vapor", email: "mike@bigcity.com", password: "123456",
    password_confirmation: "123456")
    # @user.save! - why does uncommenting this cause problems
  end

# /  Jesse had me include the @user.save! when i was failing due to  ??   /
# /  conflict with tests and the fact i didn't include a password field   /
# / after adding password the tests passed, also, this is called out as   /
# / password:  and not password_digest:  the @user.save! provides a way   /
# / to see an update of any issues during save..???....i think            /

  test " in models/user_test.rb, this defined test user should be valid" do
    assert @user.valid?
  end
  # / this test failed when the ! was added in the setup at @user.save!
  # / i am removing the @user save line 11
  # /  before_save { self.email = email.downcase!}

  test "_validate the presence of the ATTRIBUTE user_name per @user.valid? _ " do
    @user.user_name = "     "
    assert_not @user.valid?
  end

  test "validate the presence of the User ATTRIBUTE of email " do
    @user.email = "   "
    assert_not @user.valid?
  end

#  / constraints are set in  app/models/user.rb !! //
#  / creates a user name of 49 chars in length  /
  test "_ Limit to user_name attribute to be 48 char max ! " do
    @user.user_name = "x" * 49
    assert_not @user.valid?
  end

#  / let email length be 255 max                        /
#  / example email string made to be 256 char in length /
#  / @bigcity.com is 12 chars, so,                      /
#  / 244 + 12 = 256                                     /
  test "Length of email string to be 255 char MAX !" do
    @user.email = "a" * 244 + "@bigcity.com"
    assert_not @user.valid?
  end

  test ".. email validation should work and recognize valid addresses" do
    valid_addresses = %w[user@example.com mike@bigcity.com first.last@none.xp mae_moriette@bashirianemard.org bo_smith57@me.com camylle@balistreri.name isai@brown.org antonina@connelly.name cristian_collier@ondrickaleannon.com felix@herzognicolas.org jasmin.towne@baileyheel.io britney_beatty@crist.name rylan.fadel@marksbarton.co alice+bob@baz.cn A_ERADO-j@foo.bar.org cindycash@caddy.net dr.moriarity@gentlemen.net]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "test email validation rejecting bogus or suspect email formats" do
    invalid_addresses = %w[user@example,com cindycash$@dollar.net mikeatbigcity.com user_at_first.com mae_moriette@bash. camylle@bal_bal.org antonial@buzz+beer.com jakethebear uncle.fester@ doug@me..com ]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      # / these addresses are causing the test to fail /
      # / does not capture name@mail..net  consecutive dots /
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # $$$$$$$$$$$$$  DUPLICATE USER   $$$$$$$$$$$$$$$$$$$ #
  puts "   ^^^^^^^^         LINE 73          ^^^^^^^^^^^^^   "
  test "Test that email addresses should be unique, no duplicate addresses" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    puts  " The created duplicate user is >>> #{duplicate_user.inspect}"
    puts "  - - - - - - - - - Line 79 - - - - - - - - -  "
    puts " The original user's info is  >>> #{@user.inspect}"
    assert_not duplicate_user.valid?
    puts " - - - - - - - - - - - - - Line 82  - - - - - - - - - "
    puts " Is the duplicate user valid, is it UNIQUE?( F for Not Unique )=  #{duplicate_user.valid?}"
    puts " - - ASSERTED_NOT UNIQUE True at Line 84 - - - - - - - - - "
  end

#  @user.dup uses the dup method which will create a duplicate user #
# having all the same attributes as user                            #
# that dupulication is then assisgned to the duplicate_user         #
# so that there is a duplicate user.   The user email is changed to #
# upcase.  But the model says downcase before save !.









# $$$$$$$$$$$$$  DUPLICATE USER   $$$$$$$$$$$$$$$$$$$ #

  test "<-- Save email addresses in lower-case --> " do
      mixed_case_email = "HousTon@ExaMPLE.CoM"
      @user.email = mixed_case_email
      @user.save
      assert_equal mixed_case_email.downcase, @user.reload.email
    end

    #  / reload will recall the email from the database  /
    #  / assert equual tests for the equality of the two /
    #  / River Town /


test "..pword to be a min length of 4 chars..." do
  @user.password = @user.password_confirmation = "x" * 3
  assert_not @user.valid?
end


end
