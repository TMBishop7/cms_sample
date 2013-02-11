class SessionsController < ApplicationController

  layout "sessionsLayout"

  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
  	    redirect_to admin_path, :flash => { success: "Logged in as Administrator" }
      else
        redirect_to root_url, :flash => { success: "Logged in Successfully" }
      end
    else
  	  redirect_to login_url, :flash => { error: "Invalid Username/Password" }
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, :flash => { info: "Logged Out" }
  end

end
