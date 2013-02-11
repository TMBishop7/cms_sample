class Tester < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :email, :platform, :udid, :user_id
	validates_uniqueness_of :udid, :case_sensitive => false
	attr_accessible :email, :platform, :udid, :user_id
end
