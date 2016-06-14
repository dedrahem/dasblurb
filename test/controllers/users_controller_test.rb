require 'test_helper'

class UsersControllerTest < ActionController::TestCase
#  def setup
#    @user = users(:one)
#    @other_user = users(:two)
#  end

def setup
  @base_title = "dasBLURB die meisten 175"
end


test "| should get users index |" do
  get :index
  assert_response :success
  assert_select "title", "List of Users | #{@base_title}"
end

test "| should get users new |" do
  get :new
  assert_response :success
  assert_select "title", "New User Sign_Up | #{@base_title}"
end


test "| should get users show profile page |" do
  get :show
  assert_response :success
  assert_select "title", "Show User Profile | #{@base_title}"
end
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
