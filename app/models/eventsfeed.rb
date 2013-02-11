class Eventsfeed < ActiveRecord::Base
	acts_as_list :scope => :user
	validates_presence_of :title, :ical_url, :color, :user_id
	attr_accessible :title, :ical_url, :color, :position, :user_id
	belongs_to :user
end
