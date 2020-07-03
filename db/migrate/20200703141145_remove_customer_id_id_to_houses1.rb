class RemoveCustomerIdIdToHouses1 < ActiveRecord::Migration[6.0]
  def change
    remove_column :houses, :customer_id_id
  end
end
