class Newsfeed < ActiveRecord::Base
	acts_as_list :scope => :user
	validates_presence_of :title, :feed_url, :user_id
	attr_accessible :title, :feed_url, :position, :user_id
	belongs_to :user
end
