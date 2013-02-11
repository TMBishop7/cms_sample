class PlacesController < ApplicationController
  # Layout rendered
  layout "placesLayout"

  before_filter :load_user_center

  def index
    @places = @center.places.all
    @place = @center.places.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
      format.js
    end
  end

  def edit
    @place = @center.places.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @place = @center.places.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to center_places_url, notice: 'Place was successfully created.' }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = @center.places.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to center_places_url, notice: 'Place was successfully updated.' }
      else
        format.html { render action: "index" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = @center.places.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to center_places_url }
      format.js
    end
  end
end
