class LibraryHour < ActiveRecord::Base
	belongs_to :library_location
	
	attr_accessible :day, :open_time, :close_time, :library_location_id
	validates_presence_of :day, :open_time, :close_time, :library_location_id
end
