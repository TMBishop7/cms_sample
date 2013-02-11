class VideosfeedsController < ApplicationController

  before_filter :load_user

  def index
    @videosfeeds = @user.videosfeeds.all
    @videosfeed = @user.videosfeeds.new
    @videosfeeds = @user.videosfeeds.order("position") # Sortable functionality

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @videosfeed = @user.videosfeeds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @videosfeed = @user.videosfeeds.new(params[:videosfeed])

    respond_to do |format|
      if @videosfeed.save
        format.js
      else
        format.json { render json: @videosfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @videosfeed = @user.videosfeeds.find(params[:id])

    respond_to do |format|
      if @videosfeed.update_attributes(params[:videosfeed])
        format.html { redirect_to user_videosfeeds_url, notice: 'Videosfeed was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @videosfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @videosfeed = @user.videosfeeds.find(params[:id])
    @videosfeed.destroy

    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:videosfeed].each_with_index do |id, index|
      @user.videosfeeds.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
