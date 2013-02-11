class Place < ActiveRecord::Base
	belongs_to :center
	
	attr_accessible :name, :marktype, :latitude, :longitude, :center_id
	validates_presence_of :name, :marktype, :latitude, :longitude, :center_id
end
