class VehiclesController < ApplicationController
    before_action :authenticate_user_to_vehicle, only: [:show, :destroy, :update, :edit]
    
    def index
        @vehicles = Vehicle.by_user(current_user.id)
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
        find_or_create_mechanic_for_create_action
        @vehicle.mechanic_id = @mechanic.id 
        if @vehicle.save && @mechanic.save
            redirect_to user_vehicles_path(current_user)
        elsif @mechanic.save 
            @vehicle.mechanic_id = @mechanic.id 
            if @vehicle.save 
                redirect_to user_vehicles_path(current_user)
            else  
                @vehicle_errors = @vehicle.errors.full_messages
                @mechanic_errors = @mechanic.errors.full_messages
                render 'vehicles/new'
            end
        else
            @vehicle_errors = @vehicle.errors.full_messages
            @mechanic_errors = @mechanic.errors.full_messages
            render 'vehicles/new'
        end
    end

    def edit 
        @vehicle = Vehicle.find_by_id(params["id"])
        @mechanic = @vehicle.mechanic
    end
 
   def update
        @vehicle = Vehicle.find_by_id(params["id"])
        if @vehicle.update(vehicle_params)
            redirect_to user_vehicles_path(current_user)
        else
            @vehicle_errors = @vehicle.errors.full_messages
            render 'vehicles/edit'
        end
   end

    def destroy
        vehicle = Vehicle.find_by_id(params["id"])
        vehicle.destroy
        redirect_to user_vehicles_path(current_user)
    end

    private 

    def find_or_create_mechanic_for_create_action
        if @mechanic = Mechanic.find_by_id(vehicle_params["mechanic_id"])
            @mechanic = @mechanic
        else
            @mechanic = Mechanic.new(vehicle_params["mechanic_attributes"])
        end
    end

    def authenticate_user_to_vehicle
        unless current_user.vehicles.ids.include?(params["id"].to_i)
            redirect_to user_vehicles_path(current_user)
        end
    end

    def vehicle_params
        params.require(:vehicle).permit(:make, :model, :mileage, :year, :user_id, :mechanic_id, mechanic_attributes: [:first_name, :last_name, :phone_number, :shop_name])
    end


end

