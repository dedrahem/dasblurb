require 'test_helper'

class UsersControllerTest < ActionController::TestCase
#  def setup
#    @user = users(:one)
#    @other_user = users(:two)
#  end


def setup
  @base_title = "dasBLURB die meisten 175"
  @user = users(:one)
end


#  test "Users Controller: Test should get users index." do
#    puts "  "
#    puts "*************    Test Users Controller : user   ****************"
#  puts " Test: "
#    puts " Test Users Controller : user is #{@user.inspect}"
#    puts " Test: @user.valid? returns   [ #{@user.valid?}   ]"
#    puts " Test: logged_in_user is #{@logged_in_user.inspect} "
#    puts " Test: check for current user, current_user is #{@current_user.inspect}"
#    @current_user = @user
#    puts " Test:  let @current_user = @user "
#    puts " Test: @current_user.valid? returns   [ #{@current_user.valid?}   ]"
#    puts " Test: logged_in_user is  #{@logged_in_user.inspect} "
#    puts " Test: check for current user, current_user is #{@current_user.inspect}"
#    @logged_in_user = @current_user
#    puts " Test: let  @logged_in_user = @current_user "
#    puts " Test: @logged_in_user is valid ?   [ #{@logged_in_user.valid?}   ]"
#    puts " Test: @logged_in_user is #{@logged_in_user.inspect} "
#    puts "*************    Test Users Controller : user   ****************"
#    puts "  "
#    get :index
#    assert_response :success
#    assert_select "title", "List of Users | #{@base_title}"
#  end

test "Users Controler Test : Should get users new " do
  get :new
  assert_response :success
  assert_select "title", "Sign_Up New User | #{@base_title}"
end


test " Users Controller Test : Should get users show profile page. " do
  get :show, id: @user.id
  assert_response :success
  assert_select "title", "Profile for User | #{@base_title}"
end
# get :show becomes
# get :show, id: @user.id
# get "users/:id" => 'users#show', as: :user


#  test "should redirect index when not logged in" do
#    get :index
#    assert_redirected_to login_url
#  end

#  test "should get index" do
#    get :index
#    assert_response :success
#    assert_select "title",
#  end

#  test "should get new" do
#    get :new
#    assert_response :success
#  end

#  test "should get users" do
#    get :index
#    assert_response :success
#  end

end
