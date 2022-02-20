class ChangeDateTimeForFlights < ActiveRecord::Migration[6.1]
  def change
    rename_column(:flights, :flight_departure_time, :flight_departure_date)
    change_column(:flights, :flight_departure_date, :date)
    add_column(:flights, :flight_departure_time, :time)
  end
end
