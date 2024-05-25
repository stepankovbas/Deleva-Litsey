class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :cover_image

      t.timestamps
    end
  end
end
