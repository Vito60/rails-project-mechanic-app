class MechanicsController < ApplicationController
    before_action :authenticate_mechanic_to_vehicle
 
    def show
        @mechanic = Mechanic.find_by_id(params["id"])
        @mechanic_attributes = @mechanic.remove_attributes
    end

    def new 
        binding.pry
    end

    def authenticate_mechanic_to_vehicle
        unless current_user.mechanics.ids.include?(params["id"].to_i)
            redirect_to user_vehicles_path(current_user)
        end
    end
end
