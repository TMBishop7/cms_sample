class UsersController < ApplicationController

  layout "userLayout"

  before_filter :current_user

  def index
    if current_user
      @user = User.find(session[:user_id])
    else
      redirect_to login_url
    end
  end

  def change_password
    if current_user
      @user = User.find(session[:user_id])

      respond_to do |format|
        format.html
      end
    else
      redirect_to login_url
    end
  end
  
  def change_password_update
    @user = current_user
    if @user.authenticate(params[:password])
        if ((params[:new_password] == params[:new_password_confirmation]) && !params[:new_password_confirmation].blank?)
            @user.password_confirmation = params[:new_password_confirmation]
            @user.password = params[:new_password]
            
            if @user.save!
                redirect_to root_url, :flash => { success: "Password successfully updated" }
            else
                redirect_to change_password_user_path, :flash => { error: "Password not changed" }
            end      
        else
            redirect_to change_password_user_path, :flash => { error: "New Password mismatch" }
        end
    else
        redirect_to change_password_user_path, :flash => { error: "Old password incorrect" }
    end
  end

  def tab_feat
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end

  def tab_graph
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end

  def tab_dist
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end
  
  def tab_rel
    @user = User.find(session[:user_id])
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end
  
end
