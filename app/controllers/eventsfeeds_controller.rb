class EventsfeedsController < ApplicationController

  before_filter :load_user

  def index
    @eventsfeeds = @user.eventsfeeds.all
    @eventsfeed = @user.eventsfeeds.new
    @eventsfeeds = @user.eventsfeeds.order("position") # Sortable functionality

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @eventsfeed = @user.eventsfeeds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @eventsfeed = @user.eventsfeeds.new(params[:eventsfeed])

    respond_to do |format|
      if @eventsfeed.save
        format.js
      else
        format.json { render json: @eventsfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @eventsfeed = @user.eventsfeeds.find(params[:id])

    respond_to do |format|
      if @eventsfeed.update_attributes(params[:eventsfeed])
        format.html { redirect_to user_eventsfeeds_url, notice: 'Eventsfeed was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @eventsfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @eventsfeed = @user.eventsfeeds.find(params[:id])
    @eventsfeed.destroy

    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:eventsfeed].each_with_index do |id, index|
      @user.eventsfeeds.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
