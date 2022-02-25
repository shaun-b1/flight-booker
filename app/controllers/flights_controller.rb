class FlightsController < ApplicationController

  # GET /flights or /flights.json
  def index
    @airports = Airport.all
    @flights = Flight.all
    @results = Flight.search(params[:departure_airport], params[:arrival_airport], params[:flight_departure_date])
  end

  private

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_airport, :arrival_airport, :flight_departure_date, :passengers)
    end

    def results_params
      params.require(:result).permit(:flight, :passengers)
    end 
end
