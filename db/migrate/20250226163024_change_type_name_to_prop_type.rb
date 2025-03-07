class ChangeTypeNameToPropType < ActiveRecord::Migration[8.0]
  def change
    rename_column :props, :type, :prop_type
  end
end
