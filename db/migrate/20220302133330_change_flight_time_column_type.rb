class ChangeFlightTimeColumnType < ActiveRecord::Migration[6.1]
  def change 
    remove_column :flights, :flight_time
    add_column :flights, :flight_time, :integer
  end
end
