class InfoAppstoresController < ApplicationController

  before_filter :load_user
  # GET /info_appstores/1
  # GET /info_appstores/1.json
  def show
    @info_appstore = @user.info_appstore

    if @info_appstore == nil
      @info_appstore = @user.build_info_appstore
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @info_appstore }
      end
    end
  end

  # GET /info_appstores/new
  # GET /info_appstores/new.json
  def new
    @info_appstore = @user.build_info_appstore

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @info_appstore }
    end
  end

  # GET /info_appstores/1/edit
  def edit
    @info_appstore = @user.info_appstore
  end

  # POST /info_appstores
  # POST /info_appstores.json
  def create
    @info_appstore = @user.build_info_appstore(params[:info_appstore])

    respond_to do |format|
      if @info_appstore.save
        format.html { redirect_to user_info_appstore_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @info_appstore, status: :created, location: @info_appstore }
      else
        format.html { render action: "new" }
        format.json { render json: @info_appstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /info_appstores/1
  # PUT /info_appstores/1.json
  def update
    @info_appstore = @user.info_appstore

    respond_to do |format|
      if @info_appstore.update_attributes(params[:info_appstore])
        format.html { redirect_to user_info_appstore_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @info_appstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_appstores/1
  # DELETE /info_appstores/1.json
  def destroy
    @info_appstore = @user.info_appstore
    @info_appstore.destroy

    respond_to do |format|
      format.html { redirect_to new_user_info_appstore_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
