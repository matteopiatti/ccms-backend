class ChangeComponentsFieldsNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :components, :filename, false
    change_column_null :components, :name, false
    change_column_null :components, :schema, false
  end
end
