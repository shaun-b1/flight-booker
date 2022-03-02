class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :flight_departure_time
      t.integer :duration, "USING duration::integer"

      t.timestamps
    end
  end
end
