class TripsController < ApplicationController
    def index
        @trips = Trip.all
    end

    def new
        @trip = Trip.new
        @users = User.all.map { |u| {"id"=>u.id, "name"=>u.name} }
    end

    def edit
        @trip = Trip.find(params[:id])
        if @trip
            @users = User.all.map { |u| {"id"=>u.id, "name"=>u.name} }
        else
            redirect_to trips_path
        end
    end
end
