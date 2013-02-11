class IosMainIcon < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id, :size_type, :icon_image
	validates_uniqueness_of :size_type, :message => "already exists."
	attr_accessible :user_id, :size_type, :icon_image
	has_attached_file :icon_image,
					  :url => "/assets/:user_id/:class/:attachment/:size_type/:id/:filename",
					  :path => ":rails_root/public/assets/:user_id/:class/:attachment/:size_type/:id/:filename"
	validates_attachment :icon_image, :presence => true, :content_type => { :content_type => "image/png" }

	Paperclip.interpolates :user_id do |attachment, style|
      attachment.instance.user.id
    end
    Paperclip.interpolates :size_type do |attachment, style|
      attachment.instance.size_type
    end
end
