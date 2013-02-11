class NewsfeedsController < ApplicationController

  before_filter :load_user

  def index
    @newsfeeds = @user.newsfeeds.all
    @newsfeed = @user.newsfeeds.new
    @newsfeeds = @user.newsfeeds.order("position") # Sortable functionality

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @newsfeed = @user.newsfeeds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @newsfeed = @user.newsfeeds.new(params[:newsfeed])

    respond_to do |format|
      if @newsfeed.save
        format.js
      else
        format.json { render json: @newsfeed.errors, status: :unprocessable_entity, location: user_newsfeeds_url }
      end
    end
  end

  def update
    @newsfeed = @user.newsfeeds.find(params[:id])

    respond_to do |format|
      if @newsfeed.update_attributes(params[:newsfeed])
        format.html { redirect_to user_newsfeeds_url, notice: 'Newsfeed was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @newsfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @newsfeed = @user.newsfeeds.find(params[:id])
    @newsfeed.destroy

    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:newsfeed].each_with_index do |id, index|
      @user.newsfeeds.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
