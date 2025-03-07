class AddBlockToProps < ActiveRecord::Migration[8.0]
  def change
    change_column :props, :component_id, :integer, null: true
    add_reference :props, :block, null: true, foreign_key: true
  end
end
