class RenameColorColumnToCharacters < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :color, :color_id
  end
end
