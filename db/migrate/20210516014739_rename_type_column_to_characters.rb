class RenameTypeColumnToCharacters < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :type, :personality
  end
end
