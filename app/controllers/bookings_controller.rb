class BookingsController < ApplicationController

    def show
        @booking = Booking.find(params[:id])
    end 

    def new 
        @booking = Booking.new
        @flight = Flight.find(params[:flight])
        passenger_numbers = params[:passenger_count].to_i
        passenger_numbers.times { @booking.passengers.build }
    end 

    def create 
        @booking = Booking.new(passenger_params)
        @flight = Flight.where(params[:flight_id])

        if @booking.save
            flash[:success] = "Your flight is booked"
            redirect_to @booking
        else 
            flash.now[:error] = "Please fix your errors"
            render :new 
        end 
    end 

    private

    def passenger_params
        params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
    end

end
