class Opportunity < ActiveRecord::Base
	attr_accessible :code, :company, :address, :salary, :start_date, :end_date, :requirements, :approved
	validates_format_of :start_date, :with => /^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/, :message => "Invalid date", :on => :create
    validates_format_of :end_date, :with => /^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/, :message => "Invalid date", :on => :create
end