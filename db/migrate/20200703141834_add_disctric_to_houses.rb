class AddDisctricToHouses < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :district, null: false, foreign_key: true
  end
end
