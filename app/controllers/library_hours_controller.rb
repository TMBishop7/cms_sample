class LibraryHoursController < ApplicationController

  before_filter :load_user_center
  before_filter :load_library_location
  # GET /library_hours
  # GET /library_hours.json
  def index
    @library_hours = @library_location.library_hours.order("day ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @library_hours }
    end
  end

  # GET /library_hours/1
  # GET /library_hours/1.json
  def show
    @library_hour = @library_location.library_hours.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library_hour }
    end
  end

  # GET /library_hours/new
  # GET /library_hours/new.json
  def new
    @library_hour = @library_location.library_hours.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library_hour }
    end
  end

  # GET /library_hours/1/edit
  def edit
    @library_hour = @library_location.library_hours.find(params[:id])
  end

  # POST /library_hours
  # POST /library_hours.json
  def create
    @library_hour = @library_location.library_hours.new(params[:library_hour])

    respond_to do |format|
      if @library_hour.save
        format.html { redirect_to center_library_location_path(@center, @library_location), :flash => { success: 'New library hour was successfully created.' }}
        format.json { render json: @library_hour, status: :created, location: center_library_location_path(@center, @library_location) }
      else
        format.html { render action: "new" }
        format.json { render json: @library_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /library_hours/1
  # PUT /library_hours/1.json
  def update
    @library_hour = @library_location.library_hours.find(params[:id])

    respond_to do |format|
      if @library_hour.update_attributes(params[:library_hour])
        format.html { redirect_to center_library_location_path(@center, @library_location), :flash => { success: 'Library hour was successfully updated.' }}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_hours/1
  # DELETE /library_hours/1.json
  def destroy
    @library_hour = @library_location.library_hours.find(params[:id])
    @library_hour.destroy

    respond_to do |format|
      format.html { redirect_to center_library_location_path(@center, @library_location) }
      format.json { head :no_content }
    end
  end
end
