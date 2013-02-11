class AndroidTopbarsController < ApplicationController

  before_filter :load_user
  # GET /android_topbars/1
  # GET /android_topbars/1.json
  def show
    @android_topbar = @user.android_topbar

    if @android_topbar == nil
      @android_topbar = @user.build_android_topbar
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @android_topbar }
      end
    end
  end

  # GET /android_topbars/new
  # GET /android_topbars/new.json
  def new
    @android_topbar = @user.build_android_topbar

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @android_topbar }
    end
  end

  # GET /android_topbars/1/edit
  def edit
    @android_topbar = @user.android_topbar
  end

  # POST /android_topbars
  # POST /android_topbars.json
  def create
    @android_topbar = @user.build_android_topbar(params[:android_topbar])

    respond_to do |format|
      if @android_topbar.save
        format.html { redirect_to user_android_topbar_url, :flash => { success: 'Top Bar Color successfully created.' } }
        format.json { render json: @android_topbar, status: :created, location: @android_topbar }
      else
        format.html { render action: "new" }
        format.json { render json: @android_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /android_topbars/1
  # PUT /android_topbars/1.json
  def update
    @android_topbar = @user.android_topbar

    respond_to do |format|
      if @android_topbar.update_attributes(params[:android_topbar])
        format.html { redirect_to user_android_topbar_url, :flash => { success: 'Top Bar Color successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @android_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /android_topbars/1
  # DELETE /android_topbars/1.json
  def destroy
    @android_topbar = @user.android_topbar
    @android_topbar.destroy

    respond_to do |format|
      format.html { redirect_to new_user_android_topbar_url, :flash => { success: 'Top Bar Color successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
