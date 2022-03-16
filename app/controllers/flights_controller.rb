class FlightsController < ApplicationController

  def index
    @airports = Airport.all
    
    return unless results_params.present? 
    check_for_separate_airports

    @results = flight_search
  end

  private

  def results_params
    params.permit(:departure_airport, :arrival_airport, :departure_date, :passengers)
  end

  def flight_search 
    Flight.search(params[:departure_airport], params[:arrival_airport], params[:departure_date])
  end 

  def check_for_separate_airports
    if params[:departure_airport] === params[:arrival_airport]
      flash.now[:error] = "Please select different departure and arrival airports"
      render :index
    end
  end

end
