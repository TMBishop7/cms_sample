class MobileWebTopbar < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :rgb_color, :user_id
	attr_accessible :rgb_color, :user_id
end
