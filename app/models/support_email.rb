class SupportEmail < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :email_alias, :user_id
	attr_accessible :email_alias, :user_id
end
