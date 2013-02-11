class Admin::DashboardController < ApplicationController

  before_filter :auth_admin
  
  layout "adminLayout"

  def index
  	@users = User.find(:all, :conditions => { admin: false })

  	respond_to do |format|
      format.html # index.html.erb
    end
  end

end
