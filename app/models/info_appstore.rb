class InfoAppstore < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :institution_name, :app_short_name, :app_long_name, :app_description, :user_id
	attr_accessible :institution_name, :app_short_name, :app_long_name, :app_description, :user_id
end
