require 'active_record'

class AddressEntry < ActiveRecord::Base

	has_many :phone_numbers
	has_many :emails

end