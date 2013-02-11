class CnamesController < ApplicationController

  before_filter :load_user
  # GET /cnames/1
  # GET /cnames/1.json
  def show
    @cname = @user.cname

    if @cname == nil
      @cname = @user.build_cname
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cname }
      end
    end
  end

  # GET /cnames/new
  # GET /cnames/new.json
  def new
    @cname = @user.build_cname

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cname }
    end
  end

  # GET /cnames/1/edit
  def edit
    @cname = @user.cname
  end

  # POST /cnames
  # POST /cnames.json
  def create
    @cname = @user.build_cname(params[:cname])

    respond_to do |format|
      if @cname.save
        format.html { redirect_to user_cname_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @cname, status: :created, location: @cname }
      else
        format.html { render action: "new" }
        format.json { render json: @cname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cnames/1
  # PUT /cnames/1.json
  def update
    @cname = @user.cname

    respond_to do |format|
      if @cname.update_attributes(params[:cname])
        format.html { redirect_to user_cname_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cnames/1
  # DELETE /cnames/1.json
  def destroy
    @cname = @user.cname
    @cname.destroy

    respond_to do |format|
      format.html { redirect_to new_user_cname_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
