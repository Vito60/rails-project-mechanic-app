class Vehicle < ApplicationRecord
    belongs_to :user
    belongs_to :mechanic

    def combine_make_model
        self.make + " " + self.model
    end

    def delete_vehicle_attributes
        self.attributes.delete_if {|attr_name| attr_name == "id" || attr_name == "user_id" || attr_name == "mechanic_id" || attr_name == "created_at" || attr_name == "updated_at" }
    end

end
