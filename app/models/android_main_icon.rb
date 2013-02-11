class AndroidMainIcon < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id, :icon_size, :icon_image
	validates_uniqueness_of :icon_size, :message => "already exists."
	attr_accessible :user_id, :icon_size, :icon_image
	has_attached_file :icon_image,
					  :url => "/assets/:user_id/:class/:attachment/:icon_size/:id/:filename",
					  :path => ":rails_root/public/assets/:user_id/:class/:attachment/:icon_size/:id/:filename"
	validates_attachment :icon_image, :presence => true, :content_type => { :content_type => "image/png" }

	Paperclip.interpolates :user_id do |attachment, style|
      attachment.instance.user.id
    end
    Paperclip.interpolates :icon_size do |attachment, style|
      attachment.instance.icon_size
    end
end
