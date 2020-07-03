class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :address_number
      t.string :city
      t.timestamps
    end
  end
end
