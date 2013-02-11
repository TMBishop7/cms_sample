class AthleticsController < ApplicationController

  before_filter :load_user
  # GET /athletic
  # GET /athletic.json
  def show
    @athletic = @user.athletic

    if @athletic == nil
      @athletic = @user.build_athletic
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @athletic }
      end
    end
  end

  # GET /athletic/new
  # GET /athletic/new.json
  def new
    @athletic = @user.build_athletic

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @athletic }
    end
  end

  # GET /athletic/edit
  def edit
    @athletic = @user.athletic
  end

  # POST /athletic
  # POST /athletic.json
  def create
    @athletic = @user.build_athletic(params[:athletic])

    respond_to do |format|
      if @athletic.save
        format.html { redirect_to user_athletic_url, :flash => { success: 'Athletics saved.' } }
        format.json { render json: @athletic, status: :created, location: @athletic }
      else
        format.html { render action: "new" }
        format.json { render json: @athletic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /athletic
  # PUT /athletic.json
  def update
    @athletic = @user.athletic

    respond_to do |format|
      if @athletic.update_attributes(params[:athletic])
        format.html { redirect_to user_athletic_url, :flash => { success: 'Athletics updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @athletic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athletic
  # DELETE /athletic.json
  def destroy
    @athletic = @user.athletic
    @athletic.destroy

    respond_to do |format|
      format.html { redirect_to new_user_athletic_url, :flash => { success: 'Athletics deleted.' } }
      format.json { head :no_content }
    end
  end
end
