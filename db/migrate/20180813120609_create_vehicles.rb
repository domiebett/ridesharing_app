class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_model
      t.string :license_plate
      t.integer :capacity

      t.timestamps
    end
  end
end
