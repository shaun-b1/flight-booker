# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'faker'

Flight.delete_all
Airport.delete_all

AIRPORTS = {
    ATL: { LAX: 240, ORD: 115, DFW: 141, DEN: 202, JFK: 130, SFO: 325, SEA: 333, LAS: 271, MCO: 80},
    LAX: { ATL: 240, ORD: 239, DFW: 168, DEN: 138, JFK: 307, SFO: 83, SEA: 150, LAS: 62, MCO: 274},
    ORD: { ATL: 115, LAX: 239, DFW: 137, DEN: 159, JFK: 125, SFO: 278, SEA: 269, LAS: 232, MCO: 154},
    DFW: { ATL: 141, LAX: 168, ORD: 137, DEN: 110, JFK: 204, SFO: 228, SEA: 261, LAS: 174, MCO: 146}, 
    DEN: { ATL: 202, LAX: 138, ORD: 159, DFW: 110, JFK: 211, SFO: 165, SEA: 178, LAS: 111, MCO: 210}, 
    JFK: { ATL: 130, LAX: 307, ORD: 125, DFW: 204, DEN: 211, SFO: 391, SEA: 371, LAS: 351, MCO: 171}, 
    SFO: { ATL: 325, LAX: 83, ORD: 278, DFW: 228, DEN: 165, JFK: 391, SEA: 120, LAS: 91, MCO: 303}, 
    SEA: { ATL: 333, LAX: 150, ORD: 269, DFW: 261, DEN: 178, JFK: 371, SFO: 120, LAS: 136, MCO: 316}, 
    LAS: { ATL: 271, LAX: 62, ORD: 232, DFW: 174, DEN: 111, JFK: 351, SFO: 91, SEA: 136, MCO: 407}, 
    MCO: { ATL: 80, LAX: 274, ORD: 154, DFW: 146, DEN: 210, JFK: 171, SFO: 303, SEA: 316, LAS: 407}
}

AIRPORTS.each_key do |airport_code|
    Airport.create(airport_code: airport_code)
end

first_day = Date.today + 1
last_day = first_day + 5

def pair_airports 
    AIRPORTS.keys.map(&:to_s).permutation(2)
end

def flight_duration(array)
    AIRPORTS[array[0].to_sym][array[1].to_sym]
end

def daytime
    Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day)
end

(first_day...last_day).each do |day|
    pair_airports.each do |pair|
        Flight.create(departure_airport_id: Airport.find_by(airport_code: pair[0]).id,
                      arrival_airport_id: Airport.find_by(airport_code: pair[1]).id,
                      flight_departure_date: day,
                      flight_departure_time: daytime,
                      duration: flight_duration(pair))
    end
end

