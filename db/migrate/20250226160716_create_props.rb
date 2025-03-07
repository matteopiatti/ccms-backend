class CreateProps < ActiveRecord::Migration[8.0]
  def change
    create_table :props do |t|
      t.string :name
      t.string :title
      t.string :type
      t.string :default
      t.string :description

      t.timestamps
    end
  end
end
