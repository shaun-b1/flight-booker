class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
    belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
    has_many :bookings
    has_many :passengers, through: :bookings

    def self.search(departure_airport, arrival_airport, departure_date)
            departure_airport = Airport.find_by(airport_code: departure_airport)
            arrival_airport = Airport.find_by(airport_code: arrival_airport)
            if departure_airport && arrival_airport && departure_date
                self.where(departure_airport_id: departure_airport.id).where(arrival_airport_id: arrival_airport.id).where(departure_date: departure_date).limit(20)
            else 
                Flight.none
            end 
    end

    def flight_information
        "Departing at #{departure_time.strftime("%I:%M %p")} from #{departure_airport.airport_code}, arriving at #{(departure_time + flight_time.minutes).strftime("%I:%M %p")} in #{arrival_airport.airport_code}"
    end

end
