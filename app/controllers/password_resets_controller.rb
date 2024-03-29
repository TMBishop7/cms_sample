class PasswordResetsController < ApplicationController

  layout "sessionsLayout"

  def new
  end

  def create
    user = User.find_by_name_and_email(params[:name], params[:email])
    user.send_password_reset if user
    redirect_to login_url, :flash => { success: "Email sent with password reset instructions." }
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  	  redirect_to new_password_reset_path, :flash => { error: "Password reset has expired." }
  	else
  	  if @user.update_attributes(params[:user])
  	  	redirect_to login_url, :flash => { success: "Password has been reset!" }
  	  else
  	  	render :edit
  	  end
  	end
  end

end
