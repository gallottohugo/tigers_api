class AddCustomerIdToHouses1 < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :customer, foreign_key: { to_table: :users }
  end
end
