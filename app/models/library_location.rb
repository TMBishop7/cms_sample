class LibraryLocation < ActiveRecord::Base
	belongs_to :center
	has_many :library_hours
	has_many :library_contacts
	
	attr_accessible :title, :image_thumbnail_url, :latitude, :longitude, :center_id
	validates_presence_of :title, :image_thumbnail_url, :latitude, :longitude
end
