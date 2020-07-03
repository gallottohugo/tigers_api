class AddCustomerIdToHouses < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :customer_id, foreign_key: { to_table: :users }
  end
end
