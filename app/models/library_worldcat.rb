class LibraryWorldcat < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :search_key, :school_code, :user_id
	attr_accessible :search_key, :school_code, :user_id
end
