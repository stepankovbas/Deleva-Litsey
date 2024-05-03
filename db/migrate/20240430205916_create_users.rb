class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.date :birth_date
      t.string :phone_number
      t.string :sex
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :photo
      t.string :position
      t.string :class_name

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
