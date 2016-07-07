class PostsController < ApplicationController
  #  before a post is allowed check eligible
  before_action :logged_in_user, only: [:create, :destroy]

      before_action do
          if @current_user.nil?
            redirect_to sign_in_path
          end
        end
    # we do not need the actions of new and edit,
    # since we create and destroy only , oh the power !!
    # def new
    #  @post = Post.new  id: params[:id]
    # end

    def index
      # @posts = Post.all
      @users = User.paginate(page: params[:page])
      @posts = Post.paginate(page: params[:page])
      @follows = Follow.all

    end

    def show
      @post = Post.find_by id: params[:id]
    end

    # def edit
    #  @post = Post.find_by id: params[:id]
    # end

    def create
      @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "dasBlurben Mein Kamphen Saved"
          redirect_to timeline_path
        else
          @feed_items = []
          render 'homepage/dashboard'
        end  # end if
      end    # end create

# on a failed post submission the feed is supressed by assignment to #
# an empty array.   art.tut. 584                                     #
    #  def create
    #    #init a blank new Post
    #    @post = Post.new
    #    @post.user = @current_user
    #    #set the values
    #    @post.postbody = params[:post][:postbody]
    #    if @post.save
    #      # sign in w/ sessions
    #        session[:user_id] = @user_id # remember who user is  #
    #        # redirect
    #      redirect_to posts_path
    #    else
    #      render:new
    #    end
    #  end

    def update
      # instantiant / Find
      @post = Post.find_by id: params[:id]
      # set values
      @post.title = params[:post][:title]
      @post.postbody = params[:post][:postbody]
      @post.user_id = params[:post][:user_id]
      # save it
      if @post.save
        # redirect to "/posts"
        redirect_to post_path(id: @post.id)
      else
        render :edit
      end
    end

    def destroy  # IS IT DELETE OR DESTROY - it's destroy
      @post = Post.find_by id: params[:id]
      @post.destroy
      redirect_to posts_path
    end

    private
      def post_params
        params.require(:post).permit(:postbody)
      end

  end # end class
