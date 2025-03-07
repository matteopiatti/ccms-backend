class ChangeDefaultTypeInYourModel2 < ActiveRecord::Migration[8.0]
  def change
    change_column :props, :type, :string
  end
end
