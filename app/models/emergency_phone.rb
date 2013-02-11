class EmergencyPhone < ActiveRecord::Base
	belongs_to :center
	
	attr_accessible :location_name, :latitude, :longitude, :center_id
	validates_presence_of :location_name, :latitude, :longitude, :center_id
end
