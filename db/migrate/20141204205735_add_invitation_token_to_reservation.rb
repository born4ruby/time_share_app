class AddInvitationTokenToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :invitation_id, :string
  end
end
