class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :Mechanics do |t|
      t.string :first_name
      t.string :last_name
      t.string :shop_name
      t.string :phone_number
      

      t.timestamps
    end
  end
end
