class PassengerController < ApplicationController

  private 

  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end
end
