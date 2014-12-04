class Invitation < ActiveRecord::Base
  self.primary_key = 'invitation_token'

  # Associations
  has_one :reservation

  # Methods
  def generate_invitation_token
  	self.invitation_token = UUID.new.generate
  end

  def set_reservation_completed
  	self.reservation_completed = true
  	self.save!
  end
end
