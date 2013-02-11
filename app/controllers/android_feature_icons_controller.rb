class AndroidFeatureIconsController < ApplicationController

  before_filter :load_user
  # GET /android_feature_icons
  # GET /android_feature_icons.json
  def index
    @android_feature_icons = @user.android_feature_icons.order("feature_name DESC, icon_size DESC").all
    @android_feature_icon = @user.android_feature_icons.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @android_feature_icons }
      format.js
    end
  end

  # GET /android_feature_icons/1/edit
  def edit
    @android_feature_icon = @user.android_feature_icons.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /android_feature_icons
  # POST /android_feature_icons.json
  def create
    @android_feature_icon = @user.android_feature_icons.new(params[:android_feature_icon])

    respond_to do |format|
      if @android_feature_icon.save
        format.html { redirect_to user_android_feature_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { render json: @android_feature_icon, status: :created, location: @android_feature_icon }
        format.js
      else
        format.html do
          @android_feature_icons = @user.android_feature_icons.all
          render action: "index"
        end
        format.json { render json: @android_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /android_feature_icons/1
  # PUT /android_feature_icons/1.json
  def update
    @android_feature_icon = @user.android_feature_icons.find(params[:id])

    respond_to do |format|
      if @android_feature_icon.update_attributes(params[:android_feature_icon])
        format.html { redirect_to user_android_feature_icons_url, :flash => { success: "Icon successfully updated." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @android_feature_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /android_feature_icons/1
  # DELETE /android_feature_icons/1.json
  def destroy
    @android_feature_icon = @user.android_feature_icons.find(params[:id])
    @android_feature_icon.destroy

    respond_to do |format|
      format.html { redirect_to user_android_feature_icons_url }
      format.json { head :no_content }
      format.js
    end
  end
end
