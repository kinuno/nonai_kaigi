class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name,           null: false
      t.string :type,           null: false
      t.references :user,       null: false,  foreign_key: true
      t.references :room,       null: false,  foreign_key: true
      t.timestamps
    end
  end
end
