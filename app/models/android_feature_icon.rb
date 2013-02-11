class AndroidFeatureIcon < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :icon_size, :feature_name, :icon_image, :user_id
	validates_uniqueness_of :icon_size, :scope => :feature_name, :message => "already exists."
	attr_accessible :feature_name, :icon_size, :user_id, :icon_image
	has_attached_file :icon_image,
	        :url => "/assets/:user_id/:class/:attachment/:feature_name/:icon_size/:id/:filename",
	        :path => ":rails_root/public/assets/:user_id/:class/:attachment/:feature_name/:icon_size/:id/:filename"
	validates_attachment :icon_image, :presence => true, :content_type => { :content_type => "image/png" }

	Paperclip.interpolates :user_id do |attachment, style|
		attachment.instance.user.id
	end
	Paperclip.interpolates :feature_name do |attachment, style|
		attachment.instance.feature_name
	end
	Paperclip.interpolates :icon_size do |attachment, style|
		attachment.instance.icon_size
	end
end
