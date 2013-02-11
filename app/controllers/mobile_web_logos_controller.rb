class MobileWebLogosController < ApplicationController

  before_filter :load_user
  # GET /mobile_web_logos
  # GET /mobile_web_logos.json
  def index
    @mobile_web_logos = @user.mobile_web_logos.all
    @mobile_web_logo = @user.mobile_web_logos.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobile_web_logos }
      format.js
    end
  end

  # GET /mobile_web_logos/1/edit
  def edit
    @mobile_web_logo = @user.mobile_web_logos.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /mobile_web_logos
  # POST /mobile_web_logos.json
  def create
    @mobile_web_logo = @user.mobile_web_logos.new(params[:mobile_web_logo])

    respond_to do |format|
      if @mobile_web_logo.save
        format.html { redirect_to user_mobile_web_logos_url, :flash => { success: "Image successfully saved." } }
        format.json { render json: @mobile_web_logo, status: :created, location: @mobile_web_logo }
        format.js
      else
        format.html do
          @mobile_web_logos = @user.mobile_web_logos.all
          render action: "index"
        end
        format.json { render json: @mobile_web_logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_web_logos/1
  # PUT /mobile_web_logos/1.json
  def update
    @mobile_web_logo = @user.mobile_web_logos.find(params[:id])

    respond_to do |format|
      if @mobile_web_logo.update_attributes(params[:mobile_web_logo])
        format.html { redirect_to user_mobile_web_logos_url, :flash => { success: "Image successfully saved." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @mobile_web_logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_web_logos/1
  # DELETE /mobile_web_logos/1.json
  def destroy
    @mobile_web_logo = @user.mobile_web_logos.find(params[:id])
    @mobile_web_logo.destroy

    respond_to do |format|
      format.html { redirect_to user_mobile_web_logos_url }
      format.json { head :no_content }
      format.js
    end
  end
end
