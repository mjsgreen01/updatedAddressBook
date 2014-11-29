require 'active_record'

class AddressEntry < ActiveRecord::Base
  ### TODO: Add validations for:
  ###        * first_name
  ###        * last_name

	has_many :phone_numbers
	has_many :emails

end