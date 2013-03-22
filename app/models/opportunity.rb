class Opportunity < ActiveRecord::Base
	attr_accessible  :code, :company, :address, :salary, :start_date, :end_date, :requirements

	#validates_presence_of :code, :company, :address, :salary, :start_date, :end_date, :requirements
	#validates_length_of :code, :minimum => 7

end
