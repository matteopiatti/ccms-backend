class AddUniqueIndexToPagesSlug < ActiveRecord::Migration[8.0]
  def change
    add_index :pages, :slug, unique: true
  end
end
