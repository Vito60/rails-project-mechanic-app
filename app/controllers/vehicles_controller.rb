class VehiclesController < ApplicationController
    before_action :authenticate_user_to_vehicle, only: [:show, :destroy]
    
    def index
        @vehicles = current_user.vehicles
    end
    
    def show
        @vehicle = Vehicle.find_by_id(params["id"])
        @vehicle_attributes = @vehicle.delete_vehicle_attributes
    end

    def new
        @vehicle = Vehicle.new(user_id: params["user_id"])
    end

    def create
        vehicle = Vehicle.new(vehicle_params)
        if vehicle.save
            redirect_to user_vehicles_path(current_user)
        else
            render 'vehicle/new'
        end
    end

    def destroy
        vehicle = Vehicle.find_by_id(params["id"])
        vehicle.destroy
        redirect_to user_vehicles_path(current_user)
    end

    private 

    def authenticate_user_to_vehicle
        unless current_user.vehicles.ids.include?(params["id"].to_i)
            redirect_to user_path(current_user)
        end
    end

    def vehicle_params
        params.require(:vehicle).permit(:make, :model, :mileage, :year, :user_id, :mechanic_id)
    end

end
