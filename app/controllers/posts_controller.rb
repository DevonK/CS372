class PostsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
      @post.user_id = current_user.id

    respond_to do |format|
      if @post.save	#if successful
        format.html { redirect_to topic_path(@topic), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post}
      else
        format.html { redirect_to topic_path(@topic), alert: 'Invalid post' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy

   	respond_to do |format|
      if	@post.destroy
          format.html { redirect_to topic_path(@topic), notice: 'Post was successfully deleted.' }
      else
          redirect_to topic_path(@topic)
      end
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post.topic, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
    @showpost = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

end