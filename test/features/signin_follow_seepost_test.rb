require "test_helper"

class SigninFollowSeepostTest < Capybara::Rails::TestCase

  test "1of2 WALLY SIGN IN - FOLLOW JAMAL - WALLY SEE JAMAL's POSTS IN HIS(wally's) TIMELINE" do
    puts " "
    puts "                      1of2 WALLY SIGN IN - WALLY FOLLOW JAMAL - WALLY SEE JAMAL's POSTS IN HIS(wally's) TIMELINE "
    wally = User.create! email: "wally@user1.com", password: "12345", user_name: "Wally User"
    jamal = User.create! email: "jamal@user1.com", password: "12345", user_name: "Jamal User"
    puts "  "
    puts "----------------------------------- showing progress ---------------------------"
    puts " "
    puts "                       verify wally   : #{wally.inspect}"
    puts " "
    puts "                       verify jamal   : #{jamal.inspect}"
    puts " "
    jamal.posts.create!  postbody: "I am so happy to be followed by my friend Wally."
    jamal.posts.create!  postbody: "I have though, found Wally to be self-centered and arrogant."
    puts "  "
    puts "----------------------------------- showing progress ---------------------------"
    puts " "
    puts "                verify jamal's posts : #{jamal.posts.inspect}"
    puts " "
    puts "                    reverify jamal   : #{jamal.inspect}"
    puts " "

    wally.follow(jamal)

    puts "                                               -- YOU ARE HERE at Line 28 --"

    visit sign_in_path
    fill_in "Email", with: "wally@user1.com"
    fill_in "Password", with: "12345"
    click_button "Sign In"
    visit timeline_path
    puts "----------------------------------- END TEST 1 of 2 for Follow  ---------------------------"
  end


  test "2of2 IF WALLY DO NOT FOLLOW JAMAL - WALLY WILL NOT SEE JAMAL's POSTS IN WALLY's TIMELINE" do
    puts " "
    puts "2of2 IF WALLY DO NOT FOLLOW JAMAL - WALLY WILL NOT SEE JAMAL's POSTS IN WALLY's TIMELINE do "
    wally = User.create! email: "wally@user2.com", password: "12345", user_name: "Wally User"
    jamal = User.create! email: "jamal@user2.com", password: "12345", user_name: "Jamal User"
    puts "  "
    puts "----------------------------------- showing progress ---------------------------"
    puts " "
    puts "                       verify wally   : #{wally.inspect}"
    puts " "
    puts "                       verify jamal   : #{jamal.inspect}"
    puts " "

    jamal.posts.create! postbody: "I consider it a privaledge to be followed by my friend Wally."
    jamal.posts.create! postbody: "I shall endeavor to carry on the fine examples set by Wally. - Jamal"

    puts "  "
    puts "----------------------------------- showing progress ---------------------------"
    puts " "
    puts "                verify jamal's posts : #{jamal.posts.inspect}"
    puts " "
    puts "                    reverify jamal   : #{jamal.inspect}"
    puts " "

    wally.follow(jamal)

    puts "                                                  -- YOU ARE HERE at Line 64 --"
    visit sign_in_path
    fill_in "Email", with: "wally@user2.com"
    fill_in "Password", with: "12345"
    click_button "Sign In"
    visit timeline_path

    wally.unfollow(jamal)
    visit timeline_path

    puts "                                                  -- YOU ARE HERE at Line 74 --"
    refute_content page, "I consider it a privaledge to be followed by my friend Wally."
    refute_content page, "I shall endeavor to carry on the fine examples set by Wally. - Jamal"

    puts "----------------------------------- END TEST 2 of 2 for Follow  ---------------------------"
  end

end
