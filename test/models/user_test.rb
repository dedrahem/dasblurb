require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "Mike Vapor", email: "mike@bigcity.com", password_digest: "1234")
  end

  test "user model should be valid" do
    assert @user.valid?
  end

  test "name field should be populated" do
    @user.user_name = "     "
    assert_not @user.valid?
  end

  test "email should be populated" do
    @user.email = "   "
  assert_not @user.valid?
  end

end

#  / because there is a production Vs a test database  /
#  /  fixtures or hardcode    /
#  /  def setup              /
#  /  @user = User.find(1)  /
