require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.find(1)
  end

  test "MODEL TEST - is user 1 valid" do
    assert @user.valid?
  end

end
USE FIXTURES how do that wortk
