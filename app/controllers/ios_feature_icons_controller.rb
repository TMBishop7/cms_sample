class IosFeatureIconsController < ApplicationController

  before_filter :load_user
  # GET /ios_feature_icons
  # GET /ios_feature_icons.json
  def index
    @ios_feature_icons = @user.ios_feature_icons.order("feature_name ASC, icon_size DESC").all
    @ios_feature_icon = @user.ios_feature_icons.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ios_feature_icons }
      format.js
    end
  end

  # GET /ios_feature_icons/1/edit
  def edit
    @ios_feature_icon = @user.ios_feature_icons.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /ios_feature_icons
  # POST /ios_feature_icons.json
  def create
    @ios_feature_icon = @user.ios_feature_icons.new(params[:ios_feature_icon])

    respond_to do |format|
      if @ios_feature_icon.save
        format.html { redirect_to user_ios_feature_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { render json: @ios_feature_icon, status: :created, location: @ios_feature_icon }
        format.js
      else
        format.html do
          @ios_feature_icons = @user.ios_feature_icons.all
          render action: "index"
        end
        format.json { render json: @ios_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ios_feature_icons/1
  # PUT /ios_feature_icons/1.json
  def update
    @ios_feature_icon = @user.ios_feature_icons.find(params[:id])

    respond_to do |format|
      if @ios_feature_icon.update_attributes(params[:ios_feature_icon])
        format.html { redirect_to user_ios_feature_icons_url, :flash => { success: "Icon successfully updated." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @ios_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ios_feature_icons/1
  # DELETE /ios_feature_icons/1.json
  def destroy
    @ios_feature_icon = @user.ios_feature_icons.find(params[:id])
    @ios_feature_icon.destroy

    respond_to do |format|
      format.html { redirect_to user_ios_feature_icons_url }
      format.json { head :no_content }
      format.js
    end
  end
end
