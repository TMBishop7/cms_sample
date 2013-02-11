class AndroidTopbar < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :top_hex_color, :bottom_hex_color, :user_id
	attr_accessible :top_hex_color, :bottom_hex_color, :user_id
end
