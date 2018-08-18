class AddOwnerToRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :owner_id, :integer
  end
end
