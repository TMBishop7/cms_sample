class EmergencyContact < ActiveRecord::Base
	belongs_to :center

	attr_accessible :name, :phone, :link_url, :center_id
	validates_presence_of :name, :center_id
end
