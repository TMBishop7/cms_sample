class Athletic < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :provider_name, :url, :user_id
	attr_accessible :provider_name, :url, :user_id
end
