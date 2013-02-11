class IosMainIconsController < ApplicationController

  before_filter :load_user
  # GET /ios_main_icons
  # GET /ios_main_icons.json
  def index
    @ios_main_icons = @user.ios_main_icons.all.sort_by do |q| 
      IOS_MAIN.index(q.size_type)
    end
    @ios_main_icon = @user.ios_main_icons.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ios_main_icons }
      format.js
    end
  end

  # GET /ios_main_icons/1/edit
  def edit
    @ios_main_icon = @user.ios_main_icons.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /ios_main_icons
  # POST /ios_main_icons.json
  def create
    @ios_main_icon = @user.ios_main_icons.new(params[:ios_main_icon])

    respond_to do |format|
      if @ios_main_icon.save
        format.html { redirect_to user_ios_main_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { render json: @ios_main_icon, status: :created, location: @ios_main_icon }
        format.js
      else
        format.html do
          @ios_main_icons = @user.ios_main_icons.all
          render action: "index"
        end
        format.json { render json: @ios_main_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ios_main_icons/1
  # PUT /ios_main_icons/1.json
  def update
    @ios_main_icon = @user.ios_main_icons.find(params[:id])

    respond_to do |format|
      if @ios_main_icon.update_attributes(params[:ios_main_icon])
        format.html { redirect_to user_ios_main_icons_url, :flash => { success: "Icon successfully saved." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @ios_main_icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ios_main_icons/1
  # DELETE /ios_main_icons/1.json
  def destroy
    @ios_main_icon = @user.ios_main_icons.find(params[:id])
    @ios_main_icon.destroy

    respond_to do |format|
      format.html { redirect_to user_ios_main_icons_url }
      format.json { head :no_content }
      format.js
    end
  end
end
