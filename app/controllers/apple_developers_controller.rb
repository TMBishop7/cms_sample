class AppleDevelopersController < ApplicationController

  before_filter :load_user
  # GET /apple_developers/1
  # GET /apple_developers/1.json
  def show
    @apple_developer = @user.apple_developer

    if @apple_developer == nil
      @apple_developer = @user.build_apple_developer
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @apple_developer }
      end
    end
  end

  # GET /apple_developers/new
  # GET /apple_developers/new.json
  def new
    @apple_developer = @user.build_apple_developer

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apple_developer }
    end
  end

  # GET /apple_developers/1/edit
  def edit
    @apple_developer = @user.apple_developer
  end

  # POST /apple_developers
  # POST /apple_developers.json
  def create
    @apple_developer = @user.build_apple_developer(params[:apple_developer])

    respond_to do |format|
      if @apple_developer.save
        format.html { redirect_to user_apple_developer_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @apple_developer, status: :created, location: @apple_developer }
      else
        format.html { render action: "new" }
        format.json { render json: @apple_developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apple_developers/1
  # PUT /apple_developers/1.json
  def update
    @apple_developer = @user.apple_developer

    respond_to do |format|
      if @apple_developer.update_attributes(params[:apple_developer])
        format.html { redirect_to user_apple_developer_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apple_developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apple_developers/1
  # DELETE /apple_developers/1.json
  def destroy
    @apple_developer = @user.apple_developer
    @apple_developer.destroy

    respond_to do |format|
      format.html { redirect_to new_user_apple_developer_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
