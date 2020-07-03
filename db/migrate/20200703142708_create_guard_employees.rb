class CreateGuardEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :guard_employees do |t|

      t.timestamps
    end
  end
end
