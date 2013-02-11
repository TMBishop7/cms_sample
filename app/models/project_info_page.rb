class ProjectInfoPage < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :page_url, :user_id
	attr_accessible :page_url, :user_id
end
