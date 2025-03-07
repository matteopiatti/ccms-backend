class AddComponentToProps < ActiveRecord::Migration[8.0]
  def change
    add_reference :props, :component, null: false, foreign_key: true
  end
end
