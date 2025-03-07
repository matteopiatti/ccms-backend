class ChangeDefaultTypeInYourModel < ActiveRecord::Migration[8.0]
  def change
    change_column :props, :type, :integer, default: 0
  end
end
