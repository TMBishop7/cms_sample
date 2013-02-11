class LibraryContactsController < ApplicationController

  before_filter :load_user_center
  before_filter :load_library_location
  # GET /library_contacts
  # GET /library_contacts.json
  def index
    @library_contacts = @library_location.library_contacts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @library_contacts }
    end
  end

  # GET /library_contacts/1
  # GET /library_contacts/1.json
  def show
    @library_contact = @library_location.library_contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library_contact }
    end
  end

  # GET /library_contacts/new
  # GET /library_contacts/new.json
  def new
    @library_contact = @library_location.library_contacts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library_contact }
    end
  end

  # GET /library_contacts/1/edit
  def edit
    @library_contact = @library_location.library_contacts.find(params[:id])
  end

  # POST /library_contacts
  # POST /library_contacts.json
  def create
    @library_contact = @library_location.library_contacts.new(params[:library_contact])

    respond_to do |format|
      if @library_contact.save
        format.html { redirect_to center_library_location_path(@center, @library_location), :flash => { success: 'Library contact was successfully created.' }}
        format.json { render json: @library_contact, status: :created, location: center_library_location_path(@center, @library_location) }
      else
        format.html { render action: "new" }
        format.json { render json: @library_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /library_contacts/1
  # PUT /library_contacts/1.json
  def update
    @library_contact = @library_location.library_contacts.find(params[:id])

    respond_to do |format|
      if @library_contact.update_attributes(params[:library_contact])
        format.html { redirect_to center_library_location_path(@center, @library_location), :flash => { success: 'Library contact was successfully updated.' }}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_contacts/1
  # DELETE /library_contacts/1.json
  def destroy
    @library_contact = @library_location.library_contacts.find(params[:id])
    @library_contact.destroy

    respond_to do |format|
      format.html { redirect_to center_library_location_path(@center, @library_location) }
      format.json { head :no_content }
    end
  end
end
