class VehiclesController < ApplicationController
    #before_action :authenticate_user_to_customer
    
    def index
        @vehicles = current_user.vehicles
        #binding.pry
    end
    
    def show
        @vehicle = Vehicle.find_by_id(params["id"])
        @vehicle_attributes = @vehicle.delete_vehicle_attributes
    end

    def authenticate_user_to_customer
        unless current_user.customers.ids.include?(params[:customer_id].to_i)
            redirect_to user_customers_path(current_user)
        end
    end

end
