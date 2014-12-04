class AddIpAddressToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :ip_address, :string
  end
end
