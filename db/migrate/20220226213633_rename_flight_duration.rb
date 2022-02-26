class RenameFlightDuration < ActiveRecord::Migration[6.1]
  def change
    rename_column(:flights, :duration, :flight_time)
    rename_column(:flights, :flight_departure_date, :departure_date)
    rename_column(:flights, :flight_departure_time, :departure_time)
  end
end
