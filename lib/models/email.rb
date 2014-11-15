require 'active_record'

class Email < ActiveRecord::Base

	belongs_to :addressentry

end