class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  	change_column(:opportunities, :start_date, :date)
  	change_column(:opportunities, :end_date, :date)
  end
end
