class RenameComponentReferenceToProps < ActiveRecord::Migration[8.0]
  def change
    rename_column :components, :schema_id, :props_id
  end
end
