class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.date :departure_date
      t.time :departure_time
      t.text :description
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
