class AddMovementRefToGroupMovements < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_movements, :movement, null: false, foreign_key: { to_table: 'movements' }
  end
end
