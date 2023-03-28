class AddGroupRefToGroupMovements < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_movements, :group, null: false, foreign_key: { to_table: 'groups' }
  end
end
