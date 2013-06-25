class AddApprovedToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :approved, :boolean, :default => false
  end
end
