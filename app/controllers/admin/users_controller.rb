class Admin::UsersController < ApplicationController

  before_filter :auth_admin

  layout "adminLayout"
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def tab_feat
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { redirect_to admin_user_url }
      format.js
    end
  end

  def tab_graph
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { redirect_to admin_user_url }
      format.js
    end
  end

  def tab_dist
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { redirect_to admin_user_url }
      format.js
    end
  end
  
  def tab_rel
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html { redirect_to admin_user_url }
      format.js
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_url, notice: "User successfully created!" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
  	    format.html { redirect_to admin_url, notice: "User successfully created!" }
      else
  	    format.html { render action: "new" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_url }
    end
  end

end