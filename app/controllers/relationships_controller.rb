class RelationshipsController < ApplicationController

  before_action :logged_in_user

  def create
    puts "$$> Create Relationships - why @user and not user"
    user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    redirect_to user
  end

  def destroy
    puts "$$> destroy Relationships - why @user and not user"
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    redirect_to user
  end

end
