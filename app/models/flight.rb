class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport", index: true, foreign_key: "departure_airport_id"
    belongs_to :arrival_airport, class_name: "Airport", index: true, foreign_key: "arrival_airport_id"
end
