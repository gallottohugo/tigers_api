class RemoveAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :address
    remove_column :users, :address_number
  end
end
