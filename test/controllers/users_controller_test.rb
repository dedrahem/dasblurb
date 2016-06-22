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


test "| should get users index |" do
  get :index
  assert_response :success
  assert_select "title", "List of Users | #{@base_title}"
end

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
