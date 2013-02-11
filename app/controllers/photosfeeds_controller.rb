class PhotosfeedsController < ApplicationController

  before_filter :load_user

  def index
    @photosfeeds = @user.photosfeeds.all
    @photosfeed = @user.photosfeeds.new
    @photosfeeds = @user.photosfeeds.order("position") # Sortable functionality

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @photosfeed = @user.photosfeeds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @photosfeed = @user.photosfeeds.new(params[:photosfeed])

    respond_to do |format|
      if @photosfeed.save
        format.js
      else
        format.json { render json: @photosfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @photosfeed = @user.photosfeeds.find(params[:id])

    respond_to do |format|
      if @photosfeed.update_attributes(params[:photosfeed])
        format.html { redirect_to user_photosfeeds_url, notice: 'photosfeed was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @photosfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photosfeed = @user.photosfeeds.find(params[:id])
    @photosfeed.destroy

    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:photosfeed].each_with_index do |id, index|
      @user.photosfeeds.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
