class MechanicsController < ApplicationController

    def show
        @mechanic = Mechanic.find_by_id(params["id"])
        @mechanic_attributes = @mechanic.remove_attributes
    end


end
