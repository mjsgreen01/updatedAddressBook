require 'active_record'

class Email < ActiveRecord::Base
  ### TODO: Add validations for:
  ###        * category
  ###        * address

	belongs_to :addressentry

end