class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.integer :user_id
      t.integer :mechanic_id

      t.timestamps
    end
  end
end
