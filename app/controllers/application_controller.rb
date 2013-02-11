class ApplicationController < ActionController::Base
  protect_from_forgery


private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def load_user
    @user = User.find(session[:user_id]) if current_user
    @act_control = controller_name
    redirect_to login_url, :flash => { :error => "Must be logged in." } if current_user.nil?
  end

  def auth_admin
    if current_user && current_user.admin?
      @admin_user = User.find(session[:user_id])
    elsif current_user
      @user = User.find(session[:user_id])
      redirect_to root_url, :flash => { :error => "Unauthorized." }
    elsif current_user.nil?
      redirect_to login_url, :flash => { :error => "Must be logged in." }
    end
  end

  def load_user_center
    @user = User.find(session[:user_id]) if current_user
    @center = @user.centers.find(params[:center_id])
    @act_control = controller_name
    redirect_to login_url, :flash => { :error => "Must be logged in." } if current_user.nil?
  end

  def load_library_location
    @library_location = @center.library_locations.find(params[:library_location_id])
  end

  def get_controller
    @active = controller_name
    if ((@active == "newsfeeds") || (@active == "photosfeeds") || (@active == "videosfeeds") || (@active == "eventsfeeds") || (@active == "directories") || (@active == "athletics") || (@active == "library_worldcats") || (@active == "library_locations") || (@active == "library_hours") || (@active == "library_contacts") || (@active == "places") || (@active == "emergency_contacts") || (@active == "emergency_phones"))
      @active = 1
    elsif ((@active == "ios_main_icons") || (@active == "ios_feature_icons") || (@active == "ios_backgrounds") || (@active == "ios_topbars") || (@active == "android_main_icons") || (@active == "android_feature_icons") || (@active == "android_backgrounds") || (@active == "android_topbars") || (@active == "mobile_web_feature_icons") || (@active == "mobile_web_logos") || (@active == "mobile_web_topbars"))
      @active = 2
    elsif ((@active == "apple_developers") || (@active == "android_profiles") || (@active == "testers"))
      @active = 3
    elsif ((@active == "project_info_pages") || (@active == "support_emails") || (@active == "cnames") || (@active == "info_appstores"))
      @active = 4
    else
      @active = 0
    end
  end
  helper_method :get_controller

  def multi_center
    @multi_center ||= true if @user.centers.count >= 2
  end
  helper_method :multi_center

end
