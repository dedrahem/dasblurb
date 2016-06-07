require "test_helper"

class SignupTest < Capybara::Rails::TestCase

  test "sanity" do
    visit sign_up_path
    assert_content page,  "/users/new"
  end

  test "sanity two" do
    visit root_path
    assert_content page, "Sign-In"
  end

  test "sanity three" do
    visit root_path
    assert_content page, "Session"
  end

end
