class Mechanic < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true
    validates :shop_name, presence:true
    has_many :vehicles
    has_many :users, through: :vehicles

    scope :your_machanics, -> {where(user_id: current_user.id)}

    def remove_attributes
        self.attributes.delete_if {|attr_name| attr_name == "id" || attr_name == "created_at" || attr_name == "updated_at" }
    end

    def first_and_last_name
        self.first_name + " " + self.last_name 
    end

end
