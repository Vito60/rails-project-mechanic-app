class Mechanic < ApplicationRecord
    has_many :vehicles
    has_many :users, through: :vehicles

    def remove_attributes
        self.attributes.delete_if {|attr_name| attr_name == "id" || attr_name == "created_at" || attr_name == "updated_at" }
    end

end
