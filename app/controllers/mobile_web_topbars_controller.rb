class MobileWebTopbarsController < ApplicationController

  before_filter :load_user
  # GET /mobile_web_topbars/1
  # GET /mobile_web_topbars/1.json
  def show
    @mobile_web_topbar = @user.mobile_web_topbar

    if @mobile_web_topbar == nil
      @mobile_web_topbar = @user.build_mobile_web_topbar
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @mobile_web_topbar }
      end
    end
  end

  # GET /mobile_web_topbars/new
  # GET /mobile_web_topbars/new.json
  def new
    @mobile_web_topbar = @user.build_mobile_web_topbar

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mobile_web_topbar }
    end
  end

  # GET /mobile_web_topbars/1/edit
  def edit
    @mobile_web_topbar = @user.mobile_web_topbar
  end

  # POST /mobile_web_topbars
  # POST /mobile_web_topbars.json
  def create
    @mobile_web_topbar = @user.build_mobile_web_topbar(params[:mobile_web_topbar])

    respond_to do |format|
      if @mobile_web_topbar.save
        format.html { redirect_to user_mobile_web_topbar_url, :flash => { success: 'Top Bar Color successfully created.' } }
        format.json { render json: @mobile_web_topbar, status: :created, location: @mobile_web_topbar }
      else
        format.html { render action: "new" }
        format.json { render json: @mobile_web_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_web_topbars/1
  # PUT /mobile_web_topbars/1.json
  def update
    @mobile_web_topbar = @user.mobile_web_topbar

    respond_to do |format|
      if @mobile_web_topbar.update_attributes(params[:mobile_web_topbar])
        format.html { redirect_to user_mobile_web_topbar_url, :flash => { success: 'Top Bar Color successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mobile_web_topbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_web_topbars/1
  # DELETE /mobile_web_topbars/1.json
  def destroy
    @mobile_web_topbar = @user.mobile_web_topbar
    @mobile_web_topbar.destroy

    respond_to do |format|
      format.html { redirect_to new_user_mobile_web_topbar_url, :flash => { success: 'Top Bar Color successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
