class AddPhoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone1, :string
    add_column :users, :phone2, :string
  end
end
