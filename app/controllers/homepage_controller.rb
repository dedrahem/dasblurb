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
    puts " "
    puts " - - - - - - - - - - - - - - - homepage#index is : TIMELINE BEGIN  - - -"
    if logged_in?
      puts " "
      puts "In the homepage#index, current_user.inspect (NO! @) is using : # {current_user.inspect}   !"
      puts "The current user is :  #{current_user.inspect}"
      puts " "
      @post = current_user.posts
      puts " "
      puts "Let,  @post = current_user.posts      (NOT USING the .build version)  "
      puts " "
      puts "Notice : Using # {current_user.id} , the current_user is :   #{current_user.id}"
      puts " "
      @user_feed_id = current_user.id
      puts " "
      puts "Let, @user_feed_id = current_user.id "
      puts " "
      puts "Using #(@user_feed_id.inspect) the id of the user, "
      puts "  of whose posts are providing the feed  :  #{@user_feed_id.inspect} "
      puts " "
      puts " "
      puts "In homepage#index, @post.inspect using # {@post.inspect} returns : ....."
      puts " "
      puts "$$>  #{@post.inspect}"
      puts " "
      puts " <$$ end of {@post.inspect}"
      puts " "
      puts "$$> Or for post each do, "
      puts " "
      @post.each do |post|
        puts " "
        puts " #{post.inspect}"
      end
      puts " "
      puts " "
      puts "TAKE NOTE:"
      puts "Status: We are still in the controller homepage#index  PRIOR  to executing;  @feed_items = current_user.feed   "
      puts "Note that, the feed is defined in the User Model  !!!"
      puts " "
      puts " "
      # @post = current_user.posts.build  is the original line
      # @feed_items = current_user.feed.paginate(page: params[:page]) the original line
      puts "In the homepage#index and  EXECUTING NOW !! :  @feed_items = current_user.feed"
      puts "  "
      puts "  "
      @feed_items = current_user.feed.paginate(page: params[:page])
      # @feed_items = @post.paginate(page: params[:page])
      puts " "
      puts " "
      puts " "
      puts "Hello and welcome back to the controller of homepage#index immediately following @feed_items = current_user.feed"
      puts " "
      puts "So, what did we get for # {@feed_items.inspect} is : #{@feed_items.inspect}   ....end"
      puts " "
      puts " "
      @feed_items.each do |item|
        puts " "
        puts " #{item.inspect}"
      end
      puts " "
      puts " "
    end
    puts "  "
    puts " - - - - - - - - - - - - - - - - - - homepage#index : TIMELINE END  - - - - - - - - - - - - - - - - - - - - - - "
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
