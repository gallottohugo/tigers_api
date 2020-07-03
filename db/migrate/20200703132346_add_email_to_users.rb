class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :address_number, :int
    add_column :users, :user_type, :string
  end
end
