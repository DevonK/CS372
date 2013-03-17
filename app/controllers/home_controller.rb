class HomeController < ApplicationController
  respond_to :html, :json

  def index
    @topics = Topic.last(2)
    @users = User.last(2)
    @posts = Post.last(2)
    respond_with @topics
  end
end
