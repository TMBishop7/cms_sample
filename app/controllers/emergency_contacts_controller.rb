class EmergencyContactsController < ApplicationController

  before_filter :load_user_center
  # GET /emergency_contacts
  # GET /emergency_contacts.json
  def index
    @emergency_contacts = @center.emergency_contacts.all
    @emergency_contact = @center.emergency_contacts.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emergency_contacts }
      format.js
    end
  end


  # GET /emergency_contacts/1/edit
  def edit
    @emergency_contact = @center.emergency_contacts.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /emergency_contacts
  # POST /emergency_contacts.json
  def create
    @emergency_contact = @center.emergency_contacts.new(params[:emergency_contact])

    respond_to do |format|
      if @emergency_contact.save
        format.html { redirect_to center_emergency_contacts_url, notice: 'Emergency contact was successfully created.' }
        format.json { render json: @emergency_contact, status: :created, location: center_emergency_contacts_url }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emergency_contacts/1
  # PUT /emergency_contacts/1.json
  def update
    @emergency_contact = @center.emergency_contacts.find(params[:id])

    respond_to do |format|
      if @emergency_contact.update_attributes(params[:emergency_contact])
        format.html { redirect_to center_emergency_contacts_url, notice: 'Emergency contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_contacts/1
  # DELETE /emergency_contacts/1.json
  def destroy
    @emergency_contact = @center.emergency_contacts.find(params[:id])
    @emergency_contact.destroy

    respond_to do |format|
      format.html { redirect_to center_emergency_contacts_url }
      format.json { head :no_content }
      format.js
    end
  end
end
