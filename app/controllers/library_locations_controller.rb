class LibraryLocationsController < ApplicationController
  # Layout rendered
  layout "libraryLayout"

  before_filter :load_user_center
  # GET /library_locations
  # GET /library_locations.json
  def index
    @library_locations = @center.library_locations.includes(:library_hours, :library_contacts).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @library_locations }
    end
  end

  # GET /library_locations/1
  # GET /library_locations/1.json
  def show
    @library_location = @center.library_locations.includes(:library_hours, :library_contacts).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library_location }
    end
  end

  # GET /library_locations/new
  # GET /library_locations/new.json
  def new
    @library_location = @center.library_locations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library_location }
    end
  end

  # GET /library_locations/1/edit
  def edit
    @library_location = @center.library_locations.includes(:library_hours, :library_contacts).find(params[:id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library_location }
    end
  end

  # POST /library_locations
  # POST /library_locations.json
  def create
    @library_location = @center.library_locations.new(params[:library_location])

    respond_to do |format|
      if @library_location.save
        format.html { redirect_to center_library_locations_url, :flash => { success: 'Library location was successfully created.' }}
        format.json { render json: @library_location, status: :created, location: library_locations_url }
      else
        format.html { render action: "new" }
        format.json { render json: @library_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /library_locations/1
  # PUT /library_locations/1.json
  def update
    @library_location = @center.library_locations.find(params[:id])

    respond_to do |format|
      if @library_location.update_attributes(params[:library_location])
        format.html { redirect_to center_library_locations_url, :flash => { success: 'Library location was successfully updated.' }}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_locations/1
  # DELETE /library_locations/1.json
  def destroy
    @library_location = @center.library_locations.find(params[:id])
    @library_location.destroy

    respond_to do |format|
      format.html { redirect_to center_library_locations_url }
      format.json { head :no_content }
    end
  end
end
