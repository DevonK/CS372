class TopicsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :json

  def index
    @topics = Topic.all
    respond_with @topics
  end

  def show
    @topic = Topic.find(params[:id])
    respond_with @topic
  end

  def new
    @topic = Topic.new
    respond_with @topic
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(params[:topic])
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = Topic.find(params[:id])
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.destroy
        format.html { redirect_to @topic, notice: 'Topic was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def flag
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_column(:flagged, 'true')
        format.html { redirect_to @topic, notice: 'Topic was flagged' }
        format.json { head :no_content }
      else
        format.html { render "show" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def unflag
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_column(:flagged, 'false')
        format.html { redirect_to admin_topic_path, notice: 'Topic was unflagged' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_topic_path, alert: 'ERROR' }
        format.json { render json: admin_topic_path, status: :unprocessable_entity }
      end
    end
  end
end
