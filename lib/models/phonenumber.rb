require 'active_record'

class PhoneNumber < ActiveRecord::Base
  ### TODO: Add validations for:
  ###        * category
  ###        * digits

	belongs_to :addressentry

end