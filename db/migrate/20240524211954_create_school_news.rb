class CreateSchoolNews < ActiveRecord::Migration[7.1]
  def change
    create_table :school_news do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
