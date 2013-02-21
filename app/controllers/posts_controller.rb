class PostsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    #@post = @topic.posts.create(params[:post])
    @post = @topic.posts.build(params[:post])
      @post.user_id = current_user.id
   
    respond_to do |format|
      if @post.save	#if successful
        format.html { redirect_to topic_path(@topic), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post}
      else			  
        format.html { render :action => "../topics/show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy
    #redirect_to topic_path(@topic)
    
   	respond_to do |format|
      if	@post.user.id = current_user.id 
          @post.destroy
          format.html { redirect_to topic_path(@topic), notice: 'Post was successfully deleted.' }
      else
          redirect_to topic_path(@topic)
      end
    end    
  end
end