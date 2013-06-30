class Opportunity < ActiveRecord::Base
	attr_accessible :code, :company, :address, :salary, :start_date, :end_date, :requirements, :approved
	
end
