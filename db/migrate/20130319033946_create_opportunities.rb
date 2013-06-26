class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
    	t.string :code
    	t.string :company
    	t.string :address
    	t.string :salary
    	t.string :start_date
    	t.string :end_date
    	t.string :requirements
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
