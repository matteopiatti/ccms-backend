class ComponentRemoveFieldSchema < ActiveRecord::Migration[8.0]
  def change
    remove_column :components, :schema
  end
end
