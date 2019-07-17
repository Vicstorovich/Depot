class AddColumnToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :start_time, :datetime, null: false
  end
end
