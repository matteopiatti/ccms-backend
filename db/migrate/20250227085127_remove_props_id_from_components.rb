class RemovePropsIdFromComponents < ActiveRecord::Migration[8.0]
  def change
    remove_column :components, :props_id, :integer
  end
end
