class MobileWebLogo < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :logo_size, :user_id, :logo_image
	validates_uniqueness_of :logo_size, :message => "already exists."
	attr_accessible :logo_size, :user_id, :logo_image

	has_attached_file :logo_image,
					  :url => "/assets/:user_id/:class/:attachment/:logo_size/:id/:filename",
					  :path => ":rails_root/public/assets/:user_id/:class/:attachment/:logo_size/:id/:filename"
	validates_attachment :logo_image, :presence => true, :content_type => { :content_type => "image/png" }

	Paperclip.interpolates :user_id do |attachment, style|
      attachment.instance.user.id
    end
    Paperclip.interpolates :logo_size do |attachment, style|
      attachment.instance.logo_size
    end
end
