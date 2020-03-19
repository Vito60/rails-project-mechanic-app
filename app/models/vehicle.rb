class Vehicle < ApplicationRecord
    validates :make, presence: true
    validate :model, presence: true
    validates :mileage, presence: true 
    validates :year, presence: true 
    belongs_to :user
    belongs_to :mechanic
    accepts_nested_attributes_for :mechanic

    def mechanic_attributes=(mechanic_attributes)
        mechanic = Mechanic.find_or_create_by(mechanic_attributes)
    end

    def combine_make_model
        self.make + " " + self.model
    end

    def delete_vehicle_attributes
        self.attributes.delete_if {|attr_name| attr_name == "id" || attr_name == "user_id" || attr_name == "mechanic_id" || attr_name == "created_at" || attr_name == "updated_at" }
    end

end
