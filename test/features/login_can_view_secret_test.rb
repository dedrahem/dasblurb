require "test_helper"

class LoginCanViewSecretTest < Capybara::Rails::TestCase
  test "Cannot view the secret when not logged in" do
    me=User.create email: "doug@me.com", password: "mypword"

    visit root_path
    refute_content page, "#thesecret"

  end

  test "Can view the secret after sign in" do
  end
end
