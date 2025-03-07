class ChangePropData < ActiveRecord::Migration[8.0]
  def change
    change_column_null :props, :name, false
    change_column_null :props, :title, false
    change_column_null :props, :type, false
    change_column_null :props, :default, false
  end
end
