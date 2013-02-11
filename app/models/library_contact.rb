class LibraryContact < ActiveRecord::Base
	belongs_to :library_location
	
	attr_accessible :title, :phone, :email, :library_location_id
	validates_presence_of :title, :phone, :email, :library_location_id
end
