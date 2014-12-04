class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations, id: false do |t|
      t.string :user_email
      t.string :invitation_token, null: false
      t.boolean :reservation_completed, default: false

      t.timestamps
    end
    add_index :invitations, :invitation_token, unique: true
  end
end
