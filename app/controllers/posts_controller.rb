class PostsController < ApplicationController
  #  before a post is allowed check eligible
      before_action do
          if @current_user.nil?
            redirect_to sign_in_path
          end
        end

    def new
      @post = Post.new  id: params[:id]
    end

    def index
      # @posts = Post.all
      @posts = Post.all
      @users = User.all
      @follows = Follow.all

    end

    def show
      @post = Post.find_by id: params[:id]
    end

    def edit
      @post = Post.find_by id: params[:id]
    end

    def create
      #init a blank new Post
      @post = Post.new
      @post.user = @current_user
      #set the values

      @post.postbody = params[:post][:postbody]

      if @post.save
        # sign in w/ sessions
          session[:user_id] = @user_id # remember who user is
          # redirect
        redirect_to posts_path
      else
        render:new
      end
    end

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

  def delete   # IS IT DELETE OR DESTROY
    @post = Post.find_by id: params[:id]
    @post.destroy
    redirect_to posts_path
    end

  end # end class
