class MobileWebFeatureIconsController < ApplicationController

  before_filter :load_user
  # GET /mobile_web_feature_icons
  # GET /mobile_web_feature_icons.json
  def index
    @mobile_web_feature_icons = @user.mobile_web_feature_icons.order("feature_name DESC, icon_size DESC").all
    @mobile_web_feature_icon = @user.mobile_web_feature_icons.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobile_web_feature_icons }
      format.js
    end
  end

  # GET /mobile_web_feature_icons/1/edit
  def edit
    @mobile_web_feature_icon = @user.mobile_web_feature_icons.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /mobile_web_feature_icons
  # POST /mobile_web_feature_icons.json
  def create
    @mobile_web_feature_icon = @user.mobile_web_feature_icons.new(params[:mobile_web_feature_icon])

    respond_to do |format|
      if @mobile_web_feature_icon.save
        format.html { redirect_to user_mobile_web_feature_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { render json: @mobile_web_feature_icon, status: :created, location: @mobile_web_feature_icon }
        format.js
      else
        format.html do
          @mobile_web_feature_icons = @user.mobile_web_feature_icons.all
          render action: "index"
        end
        format.json { render json: @mobile_web_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_web_feature_icons/1
  # PUT /mobile_web_feature_icons/1.json
  def update
    @mobile_web_feature_icon = @user.mobile_web_feature_icons.find(params[:id])

    respond_to do |format|
      if @mobile_web_feature_icon.update_attributes(params[:mobile_web_feature_icon])
        format.html { redirect_to user_mobile_web_feature_icons_url, :flash => { success: "Icon successfully updated." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @mobile_web_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_web_feature_icons/1
  # DELETE /mobile_web_feature_icons/1.json
  def destroy
    @mobile_web_feature_icon = @user.mobile_web_feature_icons.find(params[:id])
    @mobile_web_feature_icon.destroy

    respond_to do |format|
      format.html { redirect_to user_mobile_web_feature_icons_url }
      format.json { head :no_content }
      format.js
    end
  end
end
