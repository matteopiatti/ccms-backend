class ChangeDefaultTypeInYourModel3 < ActiveRecord::Migration[8.0]
  def change
    change_column_null :props, :type, false
  end
end
