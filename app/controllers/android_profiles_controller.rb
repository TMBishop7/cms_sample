class AndroidProfilesController < ApplicationController

  before_filter :load_user
  # GET /android_profiles/1
  # GET /android_profiles/1.json
  def show
    @android_profile = @user.android_profile

    if @android_profile == nil
      @android_profile = @user.build_android_profile
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @android_profile }
      end
    end
  end

  # GET /android_profiles/new
  # GET /android_profiles/new.json
  def new
    @android_profile = @user.build_android_profile

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @android_profile }
    end
  end

  # GET /android_profiles/1/edit
  def edit
    @android_profile = @user.android_profile
  end

  # POST /android_profiles
  # POST /android_profiles.json
  def create
    @android_profile = @user.build_android_profile(params[:android_profile])

    respond_to do |format|
      if @android_profile.save
        format.html { redirect_to user_android_profile_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @android_profile, status: :created, location: @android_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @android_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /android_profiles/1
  # PUT /android_profiles/1.json
  def update
    @android_profile = @user.android_profile

    respond_to do |format|
      if @android_profile.update_attributes(params[:android_profile])
        format.html { redirect_to user_android_profile_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @android_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /android_profiles/1
  # DELETE /android_profiles/1.json
  def destroy
    @android_profile = @user.android_profile
    @android_profile.destroy

    respond_to do |format|
      format.html { redirect_to new_user_android_profile_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
