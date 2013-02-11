class LibraryWorldcatsController < ApplicationController

  before_filter :load_user
  # GET /library_worldcat
  # GET /library_worldcat.json
  def show
    @library_worldcat = @user.library_worldcat

    if @library_worldcat == nil
      @library_worldcat = @user.build_library_worldcat
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @library_worldcat }
      end
    end
  end

  # GET /library_worldcat/new
  # GET /library_worldcat/new.json
  def new
    @library_worldcat = @user.build_library_worldcat

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library_worldcat }
    end
  end

  # GET /library_worldcat/edit
  def edit
    @library_worldcat = @user.library_worldcat
  end

  # POST /library_worldcat
  # POST /library_worldcat.json
  def create
    @library_worldcat = @user.build_library_worldcat(params[:library_worldcat])

    respond_to do |format|
      if @library_worldcat.save
        format.html { redirect_to user_library_worldcat_url, :flash => { success: 'Library settings saved.' } }
        format.json { render json: @library_worldcat, status: :created, location: @library_worldcat }
      else
        format.html { render action: "new" }
        format.json { render json: @library_worldcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /library_worldcat
  # PUT /library_worldcat.json
  def update
    @library_worldcat = @user.library_worldcat

    respond_to do |format|
      if @library_worldcat.update_attributes(params[:library_worldcat])
        format.html { redirect_to user_library_worldcat_url, :flash => { success: 'Library settings updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library_worldcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_worldcat
  # DELETE /library_worldcat.json
  def destroy
    @library_worldcat = @user.library_worldcat
    @library_worldcat.destroy

    respond_to do |format|
      format.html { redirect_to new_user_library_worldcat_url, :flash => { success: 'Library settings deleted.' } }
      format.json { head :no_content }
    end
  end
end
