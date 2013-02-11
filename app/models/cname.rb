class Cname < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :cname_url, :user_id
	attr_accessible :cname_url, :user_id
end
