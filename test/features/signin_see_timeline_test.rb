require "test_helper"

class SigninSeeTimelineTest < Capybara::Rails::TestCase

  test "1of1 STEWART SIGN IN SEE TIMELINE" do
    puts " "
    puts "                                          1of1 STEWART SIGN IN - SEE TIMELINE "
    stewart = User.create! email: "stewart@hero.com", password: "12345", user_name: "Stewart User"
    puts "  "
    puts "----------------------------------- showing progress ---------------------------"
    puts " "
    puts "                       verify stewart   : #{stewart.inspect}"
    puts " "
    puts "--------------------------------------------------------------------------------"

    visit sign_in_path
    fill_in "Email", with: "stewart@hero.com"
    fill_in "Password", with: "12345"
    click_button "Sign In"
    visit timeline_path

    refute_content page, "BUBBA"
    assert_content page, "Timeline"


  end

end
