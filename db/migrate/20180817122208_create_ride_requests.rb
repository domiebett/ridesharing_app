class CreateRideRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_requests do |t|
      t.references :user, foreign_key: true
      t.references :ride, foreign_key: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
