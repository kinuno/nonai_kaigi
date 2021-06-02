class AddColorToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :color, :string
  end
end
