class RemoveCustomerIdIdToHouses < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :houses, column: :customer_id_id
  end
end
