require "test_helper"

class SignupTest < Capybara::Rails::TestCase

puts "$$> test/features/signup_test.rb  as sanity, sanity two, and sanity three"
puts "$$> test for Sign_Up, Sign-In and Blurb"

  test "sanity" do
    visit sign_up_path
    assert_content page, "Sign_Up"
  end

  test "sanity two" do
    visit root_path
    assert_content page, "Sign-In"
  end

  test "sanity three" do
    visit root_path
    assert_content page, "Blurb"
  end

  puts "$$> EXITing    :     test/features/signup_test.rb  "
  puts "$$> EXITing    :     sanity tests "


end
