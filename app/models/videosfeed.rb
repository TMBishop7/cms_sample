class Videosfeed < ActiveRecord::Base
	acts_as_list :scope => :user
	validates_presence_of :title, :youtube_username, :user_id
	attr_accessible :title, :youtube_username, :position, :user_id
	belongs_to :user
end
