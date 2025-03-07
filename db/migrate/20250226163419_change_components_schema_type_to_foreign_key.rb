class ChangeComponentsSchemaTypeToForeignKey < ActiveRecord::Migration[8.0]
  def change
    add_reference :components, :schema, null: false, foreign_key: { to_table: :props }
  end
end
