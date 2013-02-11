class Directory < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :ldap_server, :ldap_port, :ldap_base, :first_name, :last_name, :full_name, :unique_id, :user_id
	attr_accessible :ldap_server, :ldap_port, :ldap_base, :first_name, :last_name, :full_name, :title, :department, :affiliation, :address, :home_phone, :email, :room, :unique_id, :telephone, :fax, :office, :user_id
end
