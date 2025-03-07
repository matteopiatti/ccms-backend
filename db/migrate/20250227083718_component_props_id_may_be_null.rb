class ComponentPropsIdMayBeNull < ActiveRecord::Migration[8.0]
  def change
    change_column :components, :props_id, :integer, null: true
  end
end
