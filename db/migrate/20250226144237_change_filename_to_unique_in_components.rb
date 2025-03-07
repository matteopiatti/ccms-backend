class ChangeFilenameToUniqueInComponents < ActiveRecord::Migration[8.0]
  def change
    add_index :components, :filename, unique: true
  end
end
