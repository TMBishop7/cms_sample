class TestersController < ApplicationController

  before_filter :load_user
  # GET /testers
  # GET /testers.json
  def index
    @testers = @user.testers.all
    @tester = @user.testers.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testers }
      format.js
    end
  end


  # GET /testers/1/edit
  def edit
    @tester = @user.testers.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /testers
  # POST /testers.json
  def create
    @tester = @user.testers.new(params[:tester])

    respond_to do |format|
      if @tester.save
        format.html { redirect_to user_testers_url, notice: 'Tester was successfully created.' }
        format.json { render json: @tester, status: :created, location: user_testers_url }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testers/1
  # PUT /testers/1.json
  def update
    @tester = @user.testers.find(params[:id])

    respond_to do |format|
      if @tester.update_attributes(params[:tester])
        format.html { redirect_to user_testers_url, notice: 'Tester was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testers/1
  # DELETE /testers/1.json
  def destroy
    @tester = @user.testers.find(params[:id])
    @tester.destroy

    respond_to do |format|
      format.html { redirect_to user_testers_url }
      format.json { head :no_content }
      format.js
    end
  end
end
