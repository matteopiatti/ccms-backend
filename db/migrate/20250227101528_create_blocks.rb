class CreateBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :blocks do |t|
      t.references :component, null: false, foreign_key: true
      t.references :page, null: false, foreign_key: true
      t.references :parent_block, foreign_key: { to_table: :blocks }
      t.string :name, null: false
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
