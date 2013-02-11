class IosBackgroundsController < ApplicationController

  before_filter :load_user
  # GET /ios_backgrounds
  # GET /ios_backgrounds.json
  def index
    @ios_backgrounds = @user.ios_backgrounds.order("background_type_size").all
    @ios_background = @user.ios_backgrounds.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ios_backgrounds }
      format.js
    end
  end

  # GET /ios_backgrounds/1/edit
  def edit
    @ios_background = @user.ios_backgrounds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /ios_backgrounds
  # POST /ios_backgrounds.json
  def create
    @ios_background = @user.ios_backgrounds.new(params[:ios_background])

    respond_to do |format|
      if @ios_background.save
        format.html { redirect_to user_ios_backgrounds_url, :flash => { success: "Image successfully saved." } }
        format.json { render json: @ios_background, status: :created, location: @ios_background }
        format.js
      else
        format.html do
          @ios_backgrounds = @user.ios_backgrounds.all
          render action: "index"
        end
        format.json { render json: @ios_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ios_backgrounds/1
  # PUT /ios_backgrounds/1.json
  def update
    @ios_background = @user.ios_backgrounds.find(params[:id])

    respond_to do |format|
      if @ios_background.update_attributes(params[:ios_background])
        format.html { redirect_to user_ios_backgrounds_url, :flash => { success: "Image successfully saved." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @ios_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ios_backgrounds/1
  # DELETE /ios_backgrounds/1.json
  def destroy
    @ios_background = @user.ios_backgrounds.find(params[:id])
    @ios_background.destroy

    respond_to do |format|
      format.html { redirect_to user_ios_backgrounds_url }
      format.json { head :no_content }
      format.js
    end
  end
end
