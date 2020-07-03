class AddForeignKeysToGuards < ActiveRecord::Migration[6.0]
  def change
    add_reference :guard_employees, :guard, null: false, foreign_key: true
    add_reference :guard_employees, :employee, foreign_key: { to_table: :users }
  end
end
