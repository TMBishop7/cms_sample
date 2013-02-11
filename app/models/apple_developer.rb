class AppleDeveloper < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :username, :pass, :user_id
	attr_accessible :username, :pass, :user_id
end
