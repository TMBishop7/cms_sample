class Photosfeed < ActiveRecord::Base
	acts_as_list :scope => :user
	validates_presence_of :album_title, :set_number, :user_id
	attr_accessible :album_title, :set_number, :position, :user_id
	belongs_to :user
end
