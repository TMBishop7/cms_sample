class AndroidBackgroundsController < ApplicationController

  before_filter :load_user
  # GET /android_backgrounds
  # GET /android_backgrounds.json
  def index
    @android_backgrounds = @user.android_backgrounds.all.sort_by do |q| 
      ANDROID_BACK.index(q.background_type_size)
    end
    @android_background = @user.android_backgrounds.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @android_backgrounds }
      format.js
    end
  end

  # GET /android_backgrounds/1/edit
  def edit
    @android_background = @user.android_backgrounds.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /android_backgrounds
  # POST /android_backgrounds.json
  def create
    @android_background = @user.android_backgrounds.new(params[:android_background])

    respond_to do |format|
      if @android_background.save
        format.html { redirect_to user_android_backgrounds_url, :flash => { success: "Image successfully saved." } }
        format.json { render json: @android_background, status: :created, location: @android_background }
        format.js
      else
        format.html do
          @android_backgrounds = @user.android_backgrounds.all
          render action: "index"
        end
        format.json { render json: @android_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /android_backgrounds/1
  # PUT /android_backgrounds/1.json
  def update
    @android_background = @user.android_backgrounds.find(params[:id])

    respond_to do |format|
      if @android_background.update_attributes(params[:android_background])
        format.html { redirect_to user_android_backgrounds_url, :flash => { success: "Image successfully saved." } }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @android_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /android_backgrounds/1
  # DELETE /android_backgrounds/1.json
  def destroy
    @android_background = @user.android_backgrounds.find(params[:id])
    @android_background.destroy

    respond_to do |format|
      format.html { redirect_to user_android_backgrounds_url }
      format.json { head :no_content }
      format.js
    end
  end
end
