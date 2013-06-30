class ChangeDataTypeHeroku < ActiveRecord::Migration
  def up
  	rename_column :opportunities, :start_date, :start_date_string
  	add_column :opportunities, :start_date, :date
  	Opportunity.reset_column_information
  	Opportunity.find_each { |c| c.update_attribute(:start_date, c.start_date_string) } 
  	remove_column :opportunities, :start_date_string

  	rename_column :opportunities, :end_date, :end_date_string
  	add_column :opportunities, :end_date, :date
  	Opportunity.reset_column_information
  	Opportunity.find_each { |c| c.update_attribute(:end_date, c.end_date_string) } 
  	remove_column :opportunities, :end_date_string
  end

  def down
  end
end
