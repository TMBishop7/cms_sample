class AndroidMainIconsController < ApplicationController

  before_filter :load_user
  # GET /android_main_icons
  # GET /android_main_icons.json
  def index
    @android_main_icons = @user.android_main_icons.all
    @android_main_icon = @user.android_main_icons.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @android_main_icons }
      format.js
    end
  end

  # GET /android_main_icons/1/edit
  def edit
    @android_main_icon = @user.android_main_icons.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /android_main_icons
  # POST /android_main_icons.json
  def create
    @android_main_icon = @user.android_main_icons.new(params[:android_main_icon])

    respond_to do |format|
      if @android_main_icon.save
        format.html { redirect_to user_android_main_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { render json: @android_main_icon, status: :created, location: @android_main_icon }
        format.js
      else
        format.html do
          @android_main_icons = @user.android_main_icons.all
          render action: "index"
        end
        format.json { render json: @android_main_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /android_main_icons/1
  # PUT /android_main_icons/1.json
  def update
    @android_main_icon = @user.android_main_icons.find(params[:id])

    respond_to do |format|
      if @android_main_icon.update_attributes(params[:android_main_icon])
        format.html { redirect_to user_android_main_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @android_main_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /android_main_icons/1
  # DELETE /android_main_icons/1.json
  def destroy
    @android_main_icon = @user.android_main_icons.find(params[:id])
    @android_main_icon.destroy

    respond_to do |format|
      format.html { redirect_to user_android_main_icons_url }
      format.json { head :no_content }
      format.js
    end
  end
end
