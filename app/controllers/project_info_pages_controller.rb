class ProjectInfoPagesController < ApplicationController

  before_filter :load_user
  # GET /project_info_pages/1
  # GET /project_info_pages/1.json
  def show
    @project_info_page = @user.project_info_page

    if @project_info_page == nil
      @project_info_page = @user.build_project_info_page
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @project_info_page }
      end
    end
  end

  # GET /project_info_pages/new
  # GET /project_info_pages/new.json
  def new
    @project_info_page = @user.build_project_info_page

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_info_page }
    end
  end

  # GET /project_info_pages/1/edit
  def edit
    @project_info_page = @user.project_info_page
  end

  # POST /project_info_pages
  # POST /project_info_pages.json
  def create
    @project_info_page = @user.build_project_info_page(params[:project_info_page])

    respond_to do |format|
      if @project_info_page.save
        format.html { redirect_to user_project_info_page_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @project_info_page, status: :created, location: @project_info_page }
      else
        format.html { render action: "new" }
        format.json { render json: @project_info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_info_pages/1
  # PUT /project_info_pages/1.json
  def update
    @project_info_page = @user.project_info_page

    respond_to do |format|
      if @project_info_page.update_attributes(params[:project_info_page])
        format.html { redirect_to user_project_info_page_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_info_pages/1
  # DELETE /project_info_pages/1.json
  def destroy
    @project_info_page = @user.project_info_page
    @project_info_page.destroy

    respond_to do |format|
      format.html { redirect_to new_user_project_info_page_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
