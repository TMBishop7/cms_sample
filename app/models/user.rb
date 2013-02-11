class User < ActiveRecord::Base
	has_secure_password

	has_many :newsfeeds, :order => "position"
	has_many :photosfeeds, :order => "position"
	has_many :videosfeeds, :order => "position"
	has_many :eventsfeeds, :order => "position"
	has_many :centers
	has_many :ios_main_icons
	has_many :ios_feature_icons
	has_many :ios_backgrounds
	has_many :android_main_icons
	has_many :android_feature_icons
	has_many :android_backgrounds
	has_many :mobile_web_feature_icons
	has_many :mobile_web_logos
	has_many :testers
	has_one :athletic
	has_one :directory
	has_one :library_worldcat
	has_one :ios_topbar
	has_one :android_topbar
	has_one :mobile_web_topbar
	has_one :apple_developer
	has_one :android_profile
	has_one :project_info_page
	has_one :support_email
	has_one :cname
	has_one :info_appstore

	attr_accessible :name, :email, :password, :password_confirmation
	validates_uniqueness_of :name

	def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

end
