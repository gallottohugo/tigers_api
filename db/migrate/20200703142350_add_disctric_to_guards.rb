class AddDisctricToGuards < ActiveRecord::Migration[6.0]
  def change
    add_reference :guards, :district, null: false, foreign_key: true
  end
end
