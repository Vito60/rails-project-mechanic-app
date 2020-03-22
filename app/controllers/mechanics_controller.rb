class MechanicsController < ApplicationController
    before_action :authenticate_mechanic_to_vehicle
 
    def show
        @mechanic = Mechanic.find_by_id(params["id"])
        @mechanic_attributes = @mechanic.remove_attributes
    end

    def edit
        @vehicle = Vehicle.find_by_id(params["vehicle_id"])
        @mechanic = Mechanic.find_by_id(params["id"])
    end

    def update
        @mechanic = Mechanic.find_by_id(params["id"])
        if @mechanic.update(mechanic_params)
            redirect_to user_vehicle_mechanic_path(current_user, params["vehicle_id"], params["id"])
        else
            @mechanic_errors = @mechanic.errors.full_messages
            render 'mechanics/edit'
        end
    end

    private

    def mechanic_params
        params.require(:mechanic).permit(:first_name, :last_name, :phone_number, :shop_name)
    end

    def authenticate_mechanic_to_vehicle
        unless current_user.mechanics.ids.include?(params["id"].to_i)
            redirect_to user_vehicles_path(current_user)
        end
    end
end

