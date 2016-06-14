require "test_helper"

class LoginCanViewSecretTest < Capybara::Rails::TestCase


  #test "***Can sign out***" do
  #  me = User.create email: "doug@me.com", password:"mypword"
  #  visit root_path
  #  fill_in "Email", with: "doug@me.com"
  #  fill_in "Password", with: "mypword"
  #  click_button "Sign In"
  #  assert_content page, "so many secrets"
  #  click_link "Sign Out"
  #  refute_content page, "so many secrets"
  #end

  test "Cannot view the secret when not logged in" do
    me=User.create email: "doug@me.com", password: "mypword"
    visit root_path
    refute_content page, "so many secrets"
  end

#  test "!Can view the secret after sign in!" do
#    me = User.create email: "doug@me.com", password:"mypword"
#    visit sign_in_path
#    fill_in "Email", with: "doug@me.com"
#    fill_in "Password", with: "mypword"
#    click_button "Sign In"
#    assert_content page, "so many secrets"
#  end

end
