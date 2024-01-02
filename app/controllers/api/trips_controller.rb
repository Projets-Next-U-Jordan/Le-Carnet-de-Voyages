module Api
    class TripsController < ApplicationController
    	before_action :set_trip, only: [:show, :update, :destroy, :destroy_ajax]
  
    	def index
        	@trips = Trip.all
        	render json: @trips
    	end
  
    	def show
        	render json: @trip
    	end
  
		def create
        	@trip = Trip.new(trip_params)
  
        	if @trip.save
          		render json: @trip, status: :created
        	else
          		render json: @trip.errors, status: :unprocessable_entity
        	end
      	end

		def update
			if @trip.update(trip_params)
				render json: @trip
			else
				render json: @trip.errors, status: :unprocessable_entity
			end
		end
  
		def destroy
    		@trip.destroy
		end

		def destroy_ajax
			# TODO - TROUVER UN MOYEN DE METTRE UN DELAI AVANT DE RELOAD LA PAGE
    		@trip.destroy
			respond_to do |format|
				format.html { head :no_content }
				format.json { head :no_content }
				format.js { render js: 'window.location.reload();' }
			end
		end
  
		private
  
      	def set_trip
        	@trip = Trip.find(params[:id])
    	end
  
    	def trip_params
    		params.require(:trip).permit(:destination, :description, :start_date, :end_date, :user_id)
    	end
	end
end