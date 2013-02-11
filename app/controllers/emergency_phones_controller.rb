class EmergencyPhonesController < ApplicationController
  # Layout rendered
  layout "phonesLayout"

  before_filter :load_user_center
  # GET /emergency_phones
  # GET /emergency_phones.json
  def index
    @emergency_phones = @center.emergency_phones.all
    @emergency_phone = @center.emergency_phones.new #added for create new on index page!!!

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emergency_phones }
      format.js
    end
  end

  # GET /emergency_phones/1/edit
  def edit
    @emergency_phone = @center.emergency_phones.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /emergency_phones
  # POST /emergency_phones.json
  def create
    @emergency_phone = @center.emergency_phones.new(params[:emergency_phone])

    respond_to do |format|
      if @emergency_phone.save
        format.html { redirect_to center_emergency_phones_url, notice: 'Phone location was successfully created.' }
        format.json { render json: @emergency_phone, status: :created, location: center_emergency_phones_url }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @emergency_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emergency_phones/1
  # PUT /emergency_phones/1.json
  def update
    @emergency_phone = @center.emergency_phones.find(params[:id])

    respond_to do |format|
      if @emergency_phone.update_attributes(params[:emergency_phone])
        format.html { redirect_to center_emergency_phones_url, notice: 'emergency_phone was successfully updated.' }
        format.json { render json: @emergency_phone, location: center_emergency_phones_url }
      else
        format.html { render action: "index" }
        format.json { render json: @emergency_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_phones/1
  # DELETE /emergency_phones/1.json
  def destroy
    @emergency_phone = @center.emergency_phones.find(params[:id])
    @emergency_phone.destroy

    respond_to do |format|
      format.html { redirect_to center_emergency_phones_url }
      format.json { head :no_content }
      format.js
    end
  end
end
