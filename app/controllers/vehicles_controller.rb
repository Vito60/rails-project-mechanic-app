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
        @vehicle = Vehicle.new(vehicle_params)
        @mechanic = Mechanic.new(vehicle_params["mechanic_attributes"])
        if @mechanic.save
            @vehicle.mechanic_id = @mechanic.id 
            @vehicle.save
            redirect_to user_vehicles_path(current_user)
        elsif @vehicle.save
            redirect_to user_vehicles_path(current_user)
        else
            @vehicle_errors = @vehicle.errors.full_messages
            @mechanic_errors = @mechanic.errors.full_messages
            render 'vehicles/new'
        end

    end

    def edit
        @vehicle = Vehicle.find_by_id(params["id"])
    end

    def update
        @vehicle = Vehicle.find_by_id(params["id"])
        @mechanic = Mechanic.new(vehicle_params["mechanic_attributes"])
        if @mechanic.save
            @vehicle.update(vehicle_params)
            @vehicle.mechanic_id = @mechanic.id 
            @vehicle.save
            redirect_to user_vehicles_path(current_user)
        elsif @vehicle.update(vehicle_params)
            redirect_to user_vehicle_path(current_user)
        else
            redirect_to edit_user_vehicle_path(current_user, @vehicle)
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
        params.require(:vehicle).permit(:make, :model, :mileage, :year, :user_id, :mechanic_id, mechanic_attributes: [:first_name, :last_name, :phone_number, :shop_name])
    end


end
