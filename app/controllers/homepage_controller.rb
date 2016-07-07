class HomepageController < ApplicationController

  before_action :authenticate_user!

# for @feed items see the user model and follow
 # @posts = @user.posts.paginate(page: params[:page])
  def dashboard
    puts " - - - - - - - - - - - - - - - - - - - - - - - DASHBOARD BEGIN  - - -"
      @post = current_user.posts.build if logged_in?
    puts " - - - - - - - - - - - - - - - - - - - - - - - DASHBOARD END   - - -"
  end   # end def

  def index
    puts " - - - - - - - - - - - - - - - - - - - - - index TIMELINE BEGIN  - - -"
    if logged_in?
      @post = current_user.posts.build
      # @post = current_user.posts
      # @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = current_user.feed
    end
    puts " - - - - - - - - - - - - - - - - - - - - - - index TIMELINE END  - - -"
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
