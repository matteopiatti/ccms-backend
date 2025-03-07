class CreateComponents < ActiveRecord::Migration[8.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :filename
      t.json :schema

      t.timestamps
    end
  end
end
