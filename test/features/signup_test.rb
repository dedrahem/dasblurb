require "test_helper"

class SignupTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Homepage#dashboard"
  end
end
