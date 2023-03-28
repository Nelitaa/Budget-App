class CreateGroupMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :group_movements do |t|

      t.timestamps
    end
  end
end
