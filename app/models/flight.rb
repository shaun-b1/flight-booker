class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
    belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"

    def self.search(departure_airport, arrival_airport)
            departure_airport = Airport.find_by(airport_code: departure_airport)
            arrival_airport = Airport.find_by(airport_code: arrival_airport)
            if departure_airport && arrival_airport
                self.where(departure_airport_id: departure_airport.id).where(arrival_airport_id: arrival_airport.id)
            else 
                @flights = Flight.all
            end 
    end
end
