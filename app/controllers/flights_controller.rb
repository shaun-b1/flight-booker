class FlightsController < ApplicationController

  # GET /flights or /flights.json
  def index
    @airports = Airport.all

    @flights = Flight.search(params[:departure_airport], params[:arrival_airport])
  end

  private

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_airport, :arrival_airport)
    end
end
