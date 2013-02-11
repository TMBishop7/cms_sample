class Center < ActiveRecord::Base
	belongs_to :user
	has_many :emergency_phones
	has_many :emergency_contacts
	has_many :library_locations
	has_many :places

	attr_accessible :name, :latitude, :longitude, :user_id
	validates_presence_of :name, :latitude, :longitude, :user_id
end
