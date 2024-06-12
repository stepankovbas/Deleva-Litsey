
class CreateInvitationCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :invitation_codes do |t|
      t.string :code
      t.string :user_type
      t.datetime :expires_at
      t.boolean :active

      t.timestamps
    end
  end
end

