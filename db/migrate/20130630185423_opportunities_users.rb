class OpportunitiesUsers < ActiveRecord::Migration
  def change
  	create_table :opportunities_users, :id => false do |t|
      t.integer :opportunity_id
      t.integer :user_id
    end

  	add_index :opportunities_users, :opportunity_id
  	add_index :opportunities_users, :user_id
  end

  def down
  end
end
