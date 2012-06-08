class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :description
      t.string :file
      t.integer :length

      t.timestamps
    end
  end
end
