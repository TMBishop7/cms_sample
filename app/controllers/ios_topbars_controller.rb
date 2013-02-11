class IosTopbarsController < ApplicationController

  before_filter :load_user
  # GET /ios_topbars/1
  # GET /ios_topbars/1.json
  def show
    @ios_topbar = @user.ios_topbar

    if @ios_topbar == nil
      @ios_topbar = @user.build_ios_topbar
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @ios_topbar }
      end
    end
  end

  # GET /ios_topbars/new
  # GET /ios_topbars/new.json
  def new
    @ios_topbar = @user.build_ios_topbar

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ios_topbar }
    end
  end

  # GET /ios_topbars/1/edit
  def edit
    @ios_topbar = @user.ios_topbar
  end

  # POST /ios_topbars
  # POST /ios_topbars.json
  def create
    @ios_topbar = @user.build_ios_topbar(params[:ios_topbar])

    respond_to do |format|
      if @ios_topbar.save
        format.html { redirect_to user_ios_topbar_url, :flash => { success: 'Top Bar Color successfully created.' } }
        format.json { render json: @ios_topbar, status: :created, location: @ios_topbar }
      else
        format.html { render action: "new" }
        format.json { render json: @ios_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ios_topbars/1
  # PUT /ios_topbars/1.json
  def update
    @ios_topbar = @user.ios_topbar

    respond_to do |format|
      if @ios_topbar.update_attributes(params[:ios_topbar])
        format.html { redirect_to user_ios_topbar_url, :flash => { success: 'Top Bar Color successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ios_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ios_topbars/1
  # DELETE /ios_topbars/1.json
  def destroy
    @ios_topbar = @user.ios_topbar
    @ios_topbar.destroy

    respond_to do |format|
      format.html { redirect_to new_user_ios_topbar_url, :flash => { success: 'Top Bar Color successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
