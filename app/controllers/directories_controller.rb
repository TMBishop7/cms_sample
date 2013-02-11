class DirectoriesController < ApplicationController

  before_filter :load_user
  # GET /directory
  # GET /directory.json
  def show
    @directory = @user.directory

    if @directory == nil
      @directory = @user.build_directory
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @directory }
      end
    end
  end

  # GET /directory/new
  # GET /directory/new.json
  def new
    @directory = @user.build_directory

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @directory }
    end
  end

  # GET /directory/edit
  def edit
    @directory = @user.directory
  end

  # POST /directory
  # POST /directory.json
  def create
    @directory = @user.build_directory(params[:directory])

    respond_to do |format|
      if @directory.save
        format.html { redirect_to user_directory_url, :flash => { success: 'Directory saved.' } }
        format.json { render json: @directory, status: :created, location: @directory }
      else
        format.html { render action: "new" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directory
  # PUT /directory.json
  def update
    @directory = @user.directory

    respond_to do |format|
      if @directory.update_attributes(params[:directory])
        format.html { redirect_to user_directory_url, :flash => { success: 'Directory updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directory
  # DELETE /directory.json
  def destroy
    @directory = @user.directory
    @directory.destroy

    respond_to do |format|
      format.html { redirect_to new_user_directory_url, :flash => { success: 'Directory deleted.' } }
      format.json { head :no_content }
    end
  end
end
