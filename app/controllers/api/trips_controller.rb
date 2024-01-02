module Api
    class TripsController < ApplicationController
    	before_action :set_trip, only: [:show, :update, :destroy, :destroy_ajax, :update_ajax]
  
    	def index
        	@trips = Trip.all
        	render json: @trips
    	end
  
    	def show
        	render json: @trip
    	end

		def create
			response_status = create_trip
			if response_status == :created
				render json: @trip, status: :created
			else
				render json: @trip.errors, status: :unprocessable_entity
			end
		end
		  
		def create_ajax
			response_status = create_trip
			if response_status == :created
				redirect_to url_for(controller: '/trips', action: 'index') and return
			else
				redirect_to url_for(controller: '/trips', action: 'new') and return
			end
		end

		def update
			response_status = update_trip
			if response_status == :ok
				render json: @trip
			else
				render json: @trip.errors, status: :unprocessable_entity
			end
		end
		  
		def update_ajax
			response_status = update_trip
			if response_status == :ok
				redirect_to url_for(controller: '/trips', action: 'index') and return
			else
				redirect_to url_for(controller: '/trips', action: 'edit', id: @trip.id) and return
			end
		end
  
		def destroy
    		@trip.destroy
		end

		def destroy_ajax
    		@trip.destroy
			redirect_to url_for(controller: '/trips', action: 'index')
		end
  
		private
  
      	def set_trip
        	@trip = Trip.find(params[:id])
    	end

		def create_trip
			@trip = Trip.new(trip_params)
			if @trip.save
				:created
			else
				:unprocessable_entity
			end
		end

		def update_trip
			if @trip.update(trip_params)
				:ok
			else
				:unprocessable_entity
			end
		end
  
    	def trip_params
    		params.require(:trip).permit(:destination, :description, :start_date, :end_date, :user_id)
    	end
	end
end