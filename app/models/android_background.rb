class AndroidBackground < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :background_type_size, :user_id, :image
	validates_uniqueness_of :background_type_size, :message => "already exists."
	attr_accessible :background_type_size, :user_id, :image

	has_attached_file :image,
					  :url => "/assets/:user_id/:class/:attachment/:background_type_size/:id/:filename",
					  :path => ":rails_root/public/assets/:user_id/:class/:attachment/:background_type_size/:id/:filename"
	validates_attachment :image, :presence => true, :content_type => { :content_type => "image/png" }

	Paperclip.interpolates :user_id do |attachment, style|
      attachment.instance.user.id
    end
    Paperclip.interpolates :background_type_size do |attachment, style|
      attachment.instance.background_type_size
    end
end
